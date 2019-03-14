# tf-modules-example
Example for the reusable, configurable Terraform modules. Its similar to the method that can be used any where.

1-> Here we used differet AWS component elasticcache which is a In-memory data store cache service by AWS that can be used to enhance the performance of 
    the applications using redis (data structure storage) or memcached (key/value).

    To know momre about it please go through below offical aws link https://aws.amazon.com/elasticache/
	
2-> Keep the common elastic cache service creation code in elastcicache directory as a module that we use it for all the dev,test,prod environments.

3-> Now create main.tf file in each environment and import the above created module using 'source = "../../elasticache"' parameter in the module.

    Follow same for all the three environments and then plan and check the status.
	
4-> We created a main.tf file from which all the dev,test and production are run.
	
	You can check in plan it takes only the elasticcache module created and it will create seperate elasticcace in each environments.
	
	So if you want to change any count or add any other value you can directly chnage in module and it reflects all the three modules.
	
Note : Demo is to only uderstand the modules concept in terraform like wise we can implement any no of modules to accomplish our tasks.


