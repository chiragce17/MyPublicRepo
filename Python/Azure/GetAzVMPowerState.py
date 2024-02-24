from azure.identity import DefaultAzureCredential
from azure.mgmt.compute import ComputeManagementClient


credential = DefaultAzureCredential()
computer_client = ComputeManagementClient(credential,'Your Subscription Id')

vmName = 'Vm1'
vmResourceGroup = 'VMRG'

vm_status = computer_client.virtual_machines.get