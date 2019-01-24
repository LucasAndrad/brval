# Brval
This is a gem to validate many Brazilian codes. Because it's common to use many gems, libs and even copy and paste methods found around the internet to do that.

So the idea of Brval gem is: reunite all those validations methods in one single gem, making our lives even "easier" to develop Ruby apps.

[Link para ler as instruções em português](https://github.com/LucasAndrad/brval/wiki/Instru%C3%A7%C3%B5es-em-portugu%C3%AAs) (link to read the instructions in portuguese)

NPM package for JS projects coming soon!

## Installation

Add this line to your Gemfile

```ruby
gem 'brval'
```

Or run it direct on terminal:

    $ gem install brval

## Usage

To use Brval gem is quite simple, just call the module `Brval` with the validation you wish.
Examples:

```ruby
# CPF valid
Brval.cpf_valid?('79411449050') # => true

# CPF invalid
Brval.cpf_valid?('79411400000') # => false

# CNH valid
Brval.cnh_valid?('30142868570') # => true

# Título de eleitor valid
Brval.te_valid?('264632480167') # => true

# Cep valid
Brval.cep_valid?('70297-400') # => true
```

### Lista da Funções
### Functions List
Above is the list with all the functions and validations avaible on Brval gem.

| Function                  | Return      | Description |
|-------------------------|--------------|-----------|
| Brval.cep_valid?        |true/false    |           |
| Brval.cep_info?         |json          | Json with cep information          |
| Brval.cnh_valid?        |true/false    |           |
| Brval.cnpj_valid?       |true/false    |           |
| Brval.cpf_valid?        |true/false    |           |
| Brval.credit_card_valid?|true/false    | Number of credit card with 16 digits |
| Brval.lawsuit_valid?    |true/false    | Number of judicial process|
| Brval.pis_valid?        |true/false    | Same validation for: PIS/PASEP/NIT |
| Brval.renavam_valid?    |true/false    |           |
| Brval.te_valid?         |true/false    | te = "Título de eleitor" |


### CEP Validation
Brazilian postal code, CEP, doesn't has any formula or calculation to check if some CEP is valid or not, the only way to know that is searching in a database with all CEP's in Brazil

Apparently Correios doesn't provides any database with all CEP's of Brazil, so some devs developer their own services to search for a CEP info, some of those services are public API's and anyone can use it.

Considering this, Brval does the CEP validation following this flow:

 - `Brval.cep_valid?('00000000')`
 - The gem does a first query at [Via Cep API](https://viacep.com.br/)
 - If the CEP is not found, the gem does a **second** query at [WideNet API](http://apps.widenet.com.br/busca-cep)
 - If again, the CEP is not found the gem does third query to search the CEP at [Postmon API](https://postmon.com.br/)
 - And finally, if the CEP is not found in any of these three API's the gem Brval will say that this CEP doesn't exists.

The gem uses the same procedure to get the info of some CEP with the function: `Brval.cep_info(00000000)`

 **OBS:** the gem "only" search in three API's, if a CEP exists but any of these API's doesn't have it, the gem will return a false negative.


## Contributing

If you miss any validation, create an Issue explaining about it, if possible, leave some links with the calculation or any formula example about the validation. I will be happy trying to implement that to help you.

If you want to contribute with some code create an issue so we can discuss about, if everyone agree with your idea, create a fork, create your branch and send your pull request explaining the details about your PR.

Don't forget the tests, Brval use Rspec to test. Update the README with the new info. Also, try to follow the gem pattern to implement your contribution.

### Run the gem from local project
You can run the gem with: `rake console`

And before send your PR make a simulation installing the gem locally with your changes, just run the `./build.sh` script.

```
chmod +x build.sh
./build.sh
```

Thanks!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
