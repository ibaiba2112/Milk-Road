from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, DateField, DecimalField, SelectField,  BooleanField
from wtforms.validators import InputRequired, EqualTo, Optional

# MAIN PAGE FORMS #
class SearchForm(FlaskForm):
    product = StringField("", validators=[InputRequired("Need to input something!")])
    submit = SubmitField("Search") 

class RegisterForm(FlaskForm):
    first_name = StringField("", validators=[InputRequired()], render_kw={"placeholder": "First Name"})
    last_name = StringField("", validators=[InputRequired()], render_kw={"placeholder": "Last Name"})
    birthday = DateField("", validators=[InputRequired()], render_kw={"placeholder": "Birthday"})

    username = StringField("", validators=[InputRequired()], render_kw={"placeholder": "Username"})
    password1 = PasswordField("", validators=[InputRequired()], render_kw={"placeholder": "Password"})
    password2 = PasswordField("", validators=[InputRequired(), EqualTo('password1')], render_kw={"placeholder": "Confirm Password"})
    submit = SubmitField("Sign Up")

class LoginForm(FlaskForm):
    username = StringField("", validators=[InputRequired()], render_kw={"placeholder": "Username"})
    password = PasswordField("", validators=[InputRequired()], render_kw={"placeholder": "Password"})
    submit = SubmitField("Log in")

class DeleteForm(FlaskForm):
    username = StringField("", validators=[InputRequired()], render_kw={"placeholder": "Username"})
    password = PasswordField("", validators=[InputRequired()], render_kw={"placeholder": "Password"})
    submit = SubmitField("Delete Account")


# WALLET PAGE FORMS #
class WalletForm(FlaskForm):
    target_currency = SelectField("",validators=[InputRequired(),],
    choices=[
        ('usd', '🇺🇸 US Dollar (USD)'),
        ('eur', '🇪🇺 Euro (EUR)'),
        ('gbp', '🇬🇧 British Pound (GBP)'),
        ('jpy', '🇯🇵 Japanese Yen (JPY)'),
        ('cny', '🇨🇳 Chinese Yuan (CNY)'),
        ('inr', '🇮🇳 Indian Rupee (INR)'),
        ('cad', '🇨🇦 Canadian Dollar (CAD)'),
        ('aud', '🇦🇺 Australian Dollar (AUD)'),
        ('chf', '🇨🇭 Swiss Franc (CHF)'),
        ('krw', '🇰🇷 South Korean Won (KRW)'),
        ('sgd', '🇸🇬 Singapore Dollar (SGD)'),
        ('sek', '🇸🇪 Swedish Krona (SEK)'),
        ('nzd', '🇳🇿 New Zealand Dollar (NZD)'),
        ('zar', '🇿🇦 South African Rand (ZAR)'),
        ('brl', '🇧🇷 Brazilian Real (BRL)'),
        ('mxn', '🇲🇽 Mexican Peso (MXN)'),
        ('nok', '🇳🇴 Norwegian Krone (NOK)'),
        ('try', '🇹🇷 Turkish Lira (TRY)'),
        ('hkd', '🇭🇰 Hong Kong Dollar (HKD)'),
        ('dkk', '🇩🇰 Danish Krone (DKK)'),
    ]) 
       
    input_amount = DecimalField("",validators=[InputRequired(),], render_kw={"placeholder": "Select Amount"})
    conversion_mode = BooleanField("", default=True)
    convert = SubmitField("Convert")

class FundsForm(FlaskForm):
    add_funds = DecimalField('', render_kw={"placeholder": "Deposit Funds Here"}, validators=[Optional()])
    deduct_funds = DecimalField('', render_kw={"placeholder": "Withdraw Funds Here"}, validators=[Optional()])
    confirm = SubmitField('Confirm Transaction')


# ORDERS FORMS
class OrdersForm(FlaskForm):
    delivery_address = StringField('', render_kw={'placeholder': 'Delivery Address...'})
    total_price = DecimalField('', render_kw={'placeholder': 'Total Price...'})
    confirm_purchase = SubmitField('Purchase')