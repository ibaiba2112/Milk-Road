from flask import Flask, render_template, session, g, url_for, redirect, request, jsonify
from forms import SearchForm, LoginForm, RegisterForm, DeleteForm, WalletForm, FundsForm, OrdersForm
from flask_session import Session
from database import get_db, close_db
from functools import wraps
from werkzeug.security import generate_password_hash, check_password_hash
import requests
from decimal import Decimal

app = Flask(__name__)
app.teardown_appcontext(close_db)
app.config["SECRET_KEY"] = "my-secret-key"
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# /// GENERAL \\\ #

# Global #
@app.before_request
def show_logged_user():
    g.user =session.get("first_name", None)

    g.funds = session.get('funds', None) # getting funds from session in login with whatever user is on at that time
    # print(f'{g.funds}') # DEBUG to check if funds are showing in balance

    g.user_id = session.get('user_id', None)
    print(f'{g.user_id}')

    
#  Login Required #
def login_required(view):
    @wraps(view)
    def wrapped_view(*args, **kwargs):
        if g.user is None:
            return redirect(url_for("login", next=request.url))
        return view(*args, **kwargs)
    return wrapped_view

# Index/Base #
@app.route("/")
def index():
    # PAGINATION SECTION
    page = request.args.get('page', 1, type=int) # Defining the page a user is on, if user is on page 2, page =2, if no page then default to 1, int makes sure it's a number
    per_page = 9 # limit to 9 items on the page
    offset = (page - 1) * per_page # this is the position where you fetch the products for the NEXT PAGE
            # Page 1: (1-1) * 9 = 0 → start from item 0 
            # Page 2: (2-1) * 9 = 9 → start from item 9
            # Page 3: (3-1) * 9 = 18 → start from item 18

    db = get_db()

    total_products = db.execute("""SELECT COUNT(*) FROM Products""").fetchone()[0] # Getting total number of producst in db
    print(total_products)

    #
    products = db.execute(
    """SELECT * FROM Products LIMIT ? OFFSET ?;""", (per_page, offset)).fetchall() # Fetching products using limt and offset

    total_pages = (total_products + per_page - 1) // per_page # Calculated total pages needed

    return render_template("index.html", products=products, page=page, total_pages=total_pages)
    
    #  /// ACCOUNT ROUTES /// #
# /// LOGIN/SIGNUP/LOGOUT/DELETE /// #

@app.route("/login", methods=["GET", "POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        db = get_db()
        user = db.execute(
            """SELECT * FROM UserInfo
               WHERE username = ?;""", (username,)).fetchone()
        if user is None:
            form.username.errors.append("Username doesn't exist")
        elif not check_password_hash(user["password"], password):
            form.password.errors.append("Incorrect Password!")
        else:
            session.clear()
            session['username'] = username
            session['first_name'] = user['first_name']

            # session['user_id'] = str(user['user_id']) # TEST STR
            session['user_id'] = user['user_id'] # TEST INT

            
            session['funds'] = str(user['funds']) # Funds is decimal in SQL, json doesnt accept DECIMAL, need to wrap it in String first, then convert back to decimal for calcs
            print(dict(session)) # PRINTING THE WHOLE SESSION

            next_page = request.args.get("log")
            if not next_page:
                next_page = url_for("index")
            return redirect(next_page)
    return render_template("login.html", form=form)

@app.route("/logout")
def logout():
    session.pop("first_name", None)
    session.pop("password", None)
    return redirect( url_for("index"))

@app.route("/registration", methods=["GET", "POST"])
def registration():
    form = RegisterForm()
    if form.validate_on_submit():
        first_name = form.first_name.data
        last_name = form.last_name.data
        birthday = form.birthday.data
        username = form.username.data

        password1 = form.password1.data
        password2 = form.password2.data

        db = get_db()
        duplicate_user = db.execute(
            """SELECT * FROM UserInfo
               WHERE username = ?;""", (username,)).fetchone()

        if duplicate_user is not None:
            form.username.errors.append("Username already taken")
        else:
            db.execute("""
                INSERT INTO UserInfo (first_name, last_name, birthday, username, password)
                VALUES (?, ?, ?, ?, ?);""",
                (first_name, last_name, birthday, username, generate_password_hash(password1)))
            db.commit()
            return redirect(url_for('login'))
    return render_template("registration.html", form=form)

@app.route("/account_delete", methods = ["GET", "POST"])
@login_required
def delete():
    form = DeleteForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        db = get_db()
        check_password_hash(username, password)
        db.execute(
            """DELETE FROM UserInfo
               WHERE username = ?;""",
               (username, )).fetchone()
        db.commit()
        session.clear()
        return redirect(url_for('index'))
    return render_template("delete_account.html", form=form)


    #  /// ACCOUNT ROUTES /// #
# /// ACCOUNT/SETTINGS /// #
@app.route("/account_details")
@login_required
def account_details():
    db = get_db()
    user = db.execute("""SELECT * FROM UserInfo;""").fetchall()

    return render_template("account.html", UserInfo=user, product=product)

@app.route('/wallet', methods=["GET", "POST"])
@login_required
def wallet():

    # DEBUGGING USER_ID
    user_id = session.get("user_id", None)
    if not user_id:
        print("Please log in first (session)")
    else: 
        print(f'Found user_id: {user_id}')


    # DEBUGGING DB WITH USER_ID WITH CLAUSE
    db = get_db()
    user = db.execute("""SELECT * FROM UserInfo 
                              WHERE user_id =?;""", (user_id,)).fetchone()
    if user is None:
        print("Please log in first")
    else:
        print(f'User is connected! {user_id}')





    # user_id = session.get("user_id", None)
    # # g.funds = session.get('funds', None)
    # # print(f'{g.user_id} --> test') DEBUG
    # # db = get_db()
    # # user = db.execute("""SELECT * FROM UserInfo WHERE user_id = ?;""", (g.user_id,)).fetchone()

    # db = get_db()
    # get_funds = db.execute("""SELECT * FROM UserInfo 
    #                           WHERE user_id =?;""", (user_id,)).fetchone()

    wallet_form = WalletForm()
    funds_form = FundsForm()

    btc_value = None
    currency_value = None
    target_currency = None

    convert_button = wallet_form.convert.data
    confirm_button = funds_form.confirm.data
    

    if convert_button and wallet_form.validate_on_submit():
        
        target_currency = wallet_form.target_currency.data
        input_amount = wallet_form.input_amount.data
        conversion_mode = wallet_form.conversion_mode.data
        # is_flipped = False

        url = f'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies={target_currency}'
        # https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd Works {target_currency} is in the forms, whatever one is picked like 'usd', 'jpy' etc, that's how it finds the exchange rate
        response = requests.get(url).json() # sending a request to the coingecko url with my target currency --> parses the data into a json(dictionary), the link in the line above will show the json dictionary

        btc_price = response['bitcoin'][target_currency] # Extratcs the prices of bitcoin in relation to my target currency
        #  btc_price is how many dollars for 1 bitcoin --> 108795.10, this is the price of 1 bitcoin in dollars

        """
        e.g.
            input_amount = 100
            btc_price = 108795.10
            btc_value = 100 / 108795.10

        """

        if conversion_mode:
            btc_value = input_amount / btc_price # btc_value = input_amount / btc_price --> Is my desired amount(eg 100 dollars) --> divided by the PRICE of bitcoin of desired currency
            currency_value = None
            # is_flipped = True
        else: 
            currency_value = input_amount * btc_price
            btc_value = None
            # is_flipped = False
            


    elif confirm_button and funds_form.validate_on_submit():
        
        """
         // ADD/DEDUCT FUNDS FORM DATA LOGIC //

         # If form add/deduct form data is NOT None:

                --> Create add_funds variable using the add_funds form data 
                --> But wrap it in a string to process it in SQL(funds column is in TEXT)
                 
                --> Then wrap it in Decimal so it can perform calculations in python while still maintaining string format in SQL
         # Else:

                --> Or just make add_funds = 0
        """

        if funds_form.add_funds.data:
            add_funds = Decimal(str(funds_form.add_funds.data))
        else:
            add_funds = Decimal('0')

        if funds_form.deduct_funds.data:
            deduct_funds = Decimal(str(funds_form.deduct_funds.data))
        else:
             deduct_funds = Decimal('0')

        """
        // FUNDS ERROR HANLDING/CALCULATION LOGIC //

        # Make a variable 'current_funds' --> 
        # This is fetching 'UserInfo' 'funds' from SQL -->
        # But wrapping it in Decimal to perform calculations because it is TEXT in SQL

        # If both Fields(add/deduct) are populated

            --> Throw an error(Cant add and deduct at the same time)

        # elif only add_funds is populated:

            --> create variable new_funds
            --> This is going to be the current_funds + with whatever value is populated in the add_funds input field
        
        # elif only deduct_funds is populated:

            --> works exactly the same as add_funds except (-)
        
        # else:

            --> just display the current funds and nothing else because nothing was added/deducted

        
        # DB.UPDATE 
           --> Set funds to whatever value the 'new_funds' is now AND set it to the current user currently logged in
           --> But wrap it back in a string so it can pass through SQL
           --> commit changes
        
        # Update it in db and in session with 
          --> session['funds'] = str(new_funds)
           
        """
        
        current_funds = Decimal(user['funds'])
        # print(f'current_funds {current_funds}') # DEBUG

        if add_funds and deduct_funds:
            raise Exception('Cannot have both fields populated, Populate either ADD_FUNDS or DEDUCT_FUNDS, Not both at the same time')
        
        elif add_funds:
            new_funds = current_funds + add_funds
            print(f'Adding funds: {add_funds}\nNew Balance: {new_funds}')   
        
        elif deduct_funds:
            new_funds = current_funds - deduct_funds
            if new_funds < 0:
                raise Exception(f'Balance Cannot be ({new_funds}) in negative')
            elif new_funds == 0:
                new_funds = 0.0
            print(f'Deducting funds: {deduct_funds}\nNew Balance: {new_funds}')    
        
        else: 
            new_funds = current_funds
            print(f'No changes made, Curerent Balance: {new_funds}')     

        db.execute("""UPDATE UserInfo SET funds = ?
                      WHERE user_id = ?;""", (str(new_funds), user_id))
        db.commit()
        user = db.execute("""SELECT * FROM UserInfo WHERE user_id = ?;""", (user_id,)).fetchone()


        # Update session too
        session['funds'] = str(new_funds)

        return redirect(url_for('index'))

        # TODO: 
            # --> Right Now, add/deduct funds assumes you are adding bitcoin
            # --> Convert your real cash to bitcoin in conversion form, then copy and paste bitcoin result into add/deduct funds form
            # --> Might add (choose currency) -> for add/deduct funds, and dynamically adjusts bitcoin value depedning on currency chosen


    return render_template('wallet.html',wallet_form=wallet_form,funds_form=funds_form, btc_value=btc_value,currency_value=currency_value, target_currency=target_currency,UserInfo=user)

    #  /// PRODUCT ROUTES /// #
# /// PRODUCTS/PRODUCT/CART/SEARCH/ADV.SEARCH /// #
# Product
@app.route("/product/<int:serialNum>")
def product(serialNum):
    db = get_db()
    product = db.execute(""" SELECT * FROM Products
                             WHERE serialNum = ?;""", (serialNum, )).fetchone()
    
    # Weapons #
        # Firearms
    if product['category'] == 'firearm':
        details = db.execute(""" SELECT * FROM Firearms
                                 WHERE serialNum = ?;""",(serialNum, )).fetchone()
        # Explosives
    elif product['category'] == 'explosive':
        details = db.execute(""" SELECT * FROM Explosives
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        #  Ammunition
    elif product['category'] == 'ammunition':
        details = db.execute(""" SELECT * FROM Ammunition
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        #  Tactical Gear
    elif product['category'] == 'tactical_gear':
        details = db.execute(""" SELECT * FROM Tactical_Gear
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Military Equipment
    elif product['category'] == 'military_equipment':
        details = db.execute(""" SELECT * FROM Military_Equipment
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()


    # Drugs/Medicine #
        # Prescription Meds
    elif product['category'] == 'prescription_meds':
        details = db.execute(""" SELECT * FROM Prescription_Meds
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Illicit Drugs
    elif product['category'] == 'illicit_drugs':
        details = db.execute(""" SELECT * FROM Illicit_Drugs
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Research Chemicals
    elif product['category'] == 'research_chemicals':
        details = db.execute(""" SELECT * FROM Research_Chemicals
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Herbal/Natural Substances
    elif product['category'] == 'herbal_natural_substances':
        details = db.execute(""" SELECT * FROM Herbal_Natural_Substances
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()

    # Services #
        # Hacking/Cyber Services
    elif product['category'] == 'hacking_cyber_services':
        details = db.execute(""" SELECT * FROM  Hacking_Cyber_Services
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Forged Documents
    elif product['category'] == 'forged_documents':
        details = db.execute(""" SELECT * FROM Forged_Documents
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Contractors/Protection
    elif product['category'] == 'contractors_protection':
        details = db.execute(""" SELECT * FROM Contractors_Protection
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Blackmail/Info Leaks
    elif product['category'] == 'blackmail_info_leaks':
        details = db.execute(""" SELECT * FROM Blackmail_Info_Leaks
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()

    # Real Estate #
        # Safehouses
    elif product['category'] == 'safehouses':
        details = db.execute(""" SELECT * FROM Safehouses
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Underground Bunkers
    elif product['category'] == 'underground_bunkers':
        details = db.execute(""" SELECT * FROM Underground_Bunkers
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Off-grid Cabins
    elif product['category'] == ' off_grid_cabins':
        details = db.execute(""" SELECT * FROM  Off_grid_Cabins
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()

    # Lifestyle / Luxury #
        # Alcohol
    elif product['category'] == 'alcohol':
        details = db.execute(""" SELECT * FROM Alcohol
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Rare Cigars & Tobacco
    elif product['category'] == 'rare_cigars_tobacco':
        details = db.execute(""" SELECT * FROM Rare_Cigars_Tobacco
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Jewelry / Rare Gems
    elif product['category'] == 'jewelry_rare_gems':
        details = db.execute(""" SELECT * FROM Jewelry_Rare_Gems
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Artifacts / Antiquities
    elif product['category'] == 'artifacts_antiquities':
        details = db.execute(""" SELECT * FROM Artifacts_Antiquities
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Exotic Animals
    elif product['category'] == 'exotic_animals':
        details = db.execute(""" SELECT * FROM Exotic_Animals
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Designer Clothes
    elif product['category'] == 'designer_clothes':
        details = db.execute(""" SELECT * FROM Designer_Clothes
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()


    # Digital / Tech #
        # Software Keys / Licenses
    elif product['category'] == 'software_keys_licenses':
        details = db.execute(""" SELECT * FROM Software_Keys_Licenses
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Malware / Exploits
    elif product['category'] == 'malware_exploits':
        details = db.execute(""" SELECT * FROM Malware_Exploits
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Stolen Data
    elif product['category'] == 'stolen_data':
        details = db.execute(""" SELECT * FROM Stolen_Data
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Burner Phones / SIM Cards
    elif product['category'] == 'burner_phones_sim_cards':
        details = db.execute(""" SELECT * FROM Burner_Phones_SIM_Cards
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Encrypted Devices
    elif product['category'] == 'encrypted_devices':
        details = db.execute(""" SELECT * FROM Encrypted_Devices
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()

    # Random / Misc #
        # Random
    elif product['category'] == 'random':
        details = db.execute(""" SELECT * FROM Random
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Curiosities
    elif product['category'] == 'curiosities':
        details = db.execute(""" SELECT * FROM Curiosities
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Black Market Organics
    elif product['category'] == ' black_market_organics':
        details = db.execute(""" SELECT * FROM  Black_Market_Organics
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Lottery Access Codes
    elif product['category'] == 'lottery_access_codes':
        details = db.execute(""" SELECT * FROM Lottery_Access_Codes
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Underground Events
    elif product['category'] == 'underground_events':
        details = db.execute(""" SELECT * FROM Underground_Events
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
        # Custom Requests
    elif product['category'] == 'custom_requests':
        details = db.execute(""" SELECT * FROM Custom_Requests
                                 WHERE SerialNum = ?;""", (serialNum, )).fetchone()
    
            
    
    return render_template("item_details.html", product=product, details=details)


    # /// CART ROUTES /// #
# /// CART/ADD-TO-CART/INC-DEC CART /// #
@app.context_processor # This decorator runs whenever a template is rendered*(doesnt matter which one), It will automically be added to every template. You dont need to rewirtie product=product in every route
def inject_cart_count():
    cart = session.get("cart", {}) # getting the 'cart' key from the flask session if it exists
    total_cart_count = sum(cart.values()) # summing all cart values together
    return dict(total_cart_count=total_cart_count)  # returning a dict(total_cart_count with a total count that can be shown in any html template YAYAYAYA)


@app.route("/cart")
@login_required
def cart():
    if "cart" not in session:
        session["cart"] = {}
    products = {}
    db = get_db()
    total_cart_count = 0
    total = 0 #  init for the total price 

    for serialNum in session["cart"]:
        product = db.execute("""SELECT * FROM Products
                                WHERE serialNum = ?;""", (serialNum,)).fetchone()
        products[serialNum] = {
        "name": product["name"],
        "price": product["price"],
        "image": product["image"],
        "category": product["category"],
        "quantity": session["cart"][serialNum]
    }

        total_cart_count = sum(session["cart"].values()) # DEBUG --> Getting total item count in cart from the session(Not total price)
        print(f'Total Cart: {total_cart_count}') # DEBUG --> Printing total item count in cart

        
        price_accum_list = [] # init price list
        for key, value in products.items():
            print(f'Key:{key} Value:{value}') # DEBUG --> iterating over serialNum:product[dictionary] to show all product details

            name = value['name'] # Shows item name
            price = value['price'] # Shows item price
            quantity = value['quantity'] # Shows item quantity
            print(f'Product: {name} Price: {price} Quantity: {quantity}')
            
            price_accum_list.append(price * quantity) # DEBUG --> Showing list of all prices for every item picked in a price list, I am also multiplying price with QUANTITY so it will adjust prices of items depedning on their quantity
            print(price_accum_list)

            total = sum(price_accum_list) # DEBUG --> Summing all prices toghether in the price list
            print(total)
        # print(type(products[serialNum]['price'])) # DEBUG --> Finding d-type for price in sql

        # TODO:
        #   --> I added {% if g.user for the cart %}
        #   --> So it shows your cart when you're logged in but shows 0 when you're not
        #   --> But when you log back in, it forgets your session. There is no persistence
        #   --> Will wokr on this later
        #   --> Also also add costs of the products in correspondence with the wallet


    return render_template("cart.html", cart=session["cart"], products=products, total_cart_count=total_cart_count, total=total)

# Add to Cart
@app.route("/add_to_cart/<int:serialNum>")
@login_required
def add_to_cart(serialNum):
    if "cart" not in session: # if cart doesnt exist --> then create a cart dictionary
        session["cart"] = {}
    if serialNum not in session["cart"]: # if product doesnt already exist in the cart
        session["cart"][serialNum] = 1
        print(f'{session["cart"]} # DEUBG (Newly added product)')
    else:
        session["cart"][serialNum] = session["cart"][serialNum] + 1 # if product with same serialNum already exists in the cart
        print(f'{session["cart"]} DEBUG (Adding already existing product in cart)')
    session.modified = True
    return redirect( url_for("cart"))

# Remove from Cart
@app.route("/remove_from_cart/<int:serialNum>")
@login_required
def remove_from_cart(serialNum):
    # If serialNum value exists in cart key in the session
    if serialNum in session["cart"]:
        # Delete the whole item with the specific value
        del session["cart"][serialNum]
        print(f'{session["cart"]} DEBUG (Deleting whole item with "remove item" option')
    session.modified = True
    return redirect( url_for("cart"))

# Increment Cart
@app.route("/increment_cart/<int:serialNum>")
@login_required
def increment_cart(serialNum):
    if serialNum not in session["cart"]: # Works similar to 'ADD_TO_CART', adds new item with the given serialNum and assigns it as 1
        session["cart"][serialNum] = 1
        print(f'{session["cart"]} # DEUBG (Newly added product (+))')
    else:
        session["cart"][serialNum] = session["cart"][serialNum] + 1 # Works similar to 'ADD_TO_CART' again, just increments the pre-existing item
        print(f'{session["cart"]} DEBUG (Adding already existing product in cart (+))')

    session.modified = True
    return redirect( url_for("cart"))

# Decrement Cart 
@app.route("/decrement_cart/<int:serialNum>")
@login_required
def decrement_cart(serialNum):
    if serialNum in session["cart"]: # If item with speicifc serialNum is in Cart
        session["cart"][serialNum] -= 1 # deduct 1 from cart from key with the specific serialNum 
        print(f'{session["cart"]} # DEUBG (DELETING Existing product (-))')

        if session["cart"][serialNum] <= 0: # If item is greater or equal to 0
            del session["cart"][serialNum] # just get rid of the key from the cart diciotnary
            print(f'{session["cart"]} DEBUG (Deleting last product in cart (Getting rid of item key) (-))')

    session.modified = True
    return redirect( url_for("cart"))

# Clear Cart
@app.route("/clear_cart")
@login_required
def clear_cart():
    # If the cart exists at all in the session
    if session["cart"]:
        # Delete the whole cart
        print(f'{session["cart"]} DEBUG  (Deleting Whole cart)')
        del session["cart"]
    session.modified = True
    return redirect( url_for("cart"))

        
    # /// Orders \\\ #
# /// Orders/Order<int:order_id>/Order History \\\ # 
# Order History
# @app.route("/OrderHistory")
# @login_required
# def orderHistory():
#     db = get_db()
#     orderHistory = db.execute(
#                         """SELECT * FROM Orders;""").fetchall()
#     return render_template("orderHistory.html", orderHistory=orderHistory)

@app.route('/order', methods=["GET", "POST"])
@login_required
def order():

    form = OrdersForm()
    if form.validate_on_submit():
        delivery_address = form.delivery_address.data

        if form.total_price.data:
            total_price = Decimal(str(form.total_price.data))

        db = get_db()
        db.execute("""INSERT INTO Orders(order_delivery_address, order_total_price)
                      VALUES (?, ?);""",
                      (delivery_address, str(total_price)))
        db.commit()
        return redirect( url_for('index'))
    return render_template('order.html', form=form)


