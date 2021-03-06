# Create an Application Insights
resource "azurerm_application_insights" "app-insights" {
  name                = "aspdotnet-app-insights-${var.env}"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  application_type    = "web"
  
  tags = {
    user = "dostapenko" 
    app  = "aspdotnet-docker-app"
  }
}

resource "azurerm_application_insights_web_test" "web-test" {
  name                    = "aspdotnet-appinsights-${var.env}-webtest"
  location                = azurerm_resource_group.resource-group.location
  resource_group_name     = azurerm_resource_group.resource-group.name
  application_insights_id = azurerm_application_insights.app-insights.id
  kind                    = "ping"
  frequency               = 300
  timeout                 = 60
  enabled                 = true   
  geo_locations           = ["emea-nl-ams-azr", "us-va-ash-azr", "us-ca-sjc-azr"]

  configuration = <<XML
<WebTest Name="WebTest1" Id="ABD48585-0831-40CB-9069-682EA6BB3583" Enabled="True" CssProjectStructure="" CssIteration="" Timeout="0" WorkItemIds="" xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010" Description="" CredentialUserName="" CredentialPassword="" PreAuthenticate="True" Proxy="default" StopOnError="False" RecordedResultFile="" ResultsLocale="">
  <Items>
    <Request Method="GET" Guid="a5f10126-e4cd-570d-961c-cea43999a200" Version="1.1" Url="https://aspdotnet-app-service-${var.env}.azurewebsites.net" ThinkTime="0" Timeout="300" ParseDependentRequests="True" FollowRedirects="True" RecordResult="True" Cache="False" ResponseTimeGoal="0" Encoding="utf-8" ExpectedHttpStatusCode="200" ExpectedResponseUrl="" ReportingName="" IgnoreHttpStatusCode="False" />
  </Items>
</WebTest>
XML

  tags = {
    user = "dostapenko"
    app  = "aspdotnet-docker-app"
  }
}

output "webtest_id" {
  value = azurerm_application_insights_web_test.web-test.id
}

#output "webtest_provisioning_state" {
#  value = azurerm_application_insights_web_test.web-test.provisioning_state
#}

output "webtests_synthetic_id" {
  value = azurerm_application_insights_web_test.web-test.synthetic_monitor_id
}

output "instrumentation_key" {
  value = azurerm_application_insights.app-insights.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.app-insights.app_id
}  
