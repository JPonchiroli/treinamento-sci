<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE Nodes [

<!ENTITY % NameValue "CDATA">
<!ENTITY % PropType "(I|S|D|L|H|B)">
<!ENTITY % VersionValue "CDATA">

<!ELEMENT Prp (#PCDATA)>
<!ELEMENT Node (Node|Prp)*>
<!ELEMENT Nodes (Node)+>

<!ATTLIST Nodes version CDATA "1">

<!ATTLIST Node name CDATA #REQUIRED>

<!ATTLIST Prp name CDATA #REQUIRED>
<!ATTLIST Prp type CDATA #REQUIRED>
<!ATTLIST Prp value CDATA #REQUIRED>
]>
<Nodes version="1">
	<Node name="root">
		<Prp name="start time" type="D" value="45817.6281452662"/>
		<Prp name="test type" type="S" value="pConsultaPessoa"/>
		<Prp name="stop time" type="D" value="45817.6282102546"/>
		<Prp name="error count" type="I" value="0"/>
		<Prp name="warning count" type="I" value="0"/>
		<Prp name="root logdata name" type="S" value="Test Log [uCadastroPessoa\pConsultaPessoa]"/>
		<Prp name="completed" type="B" value="-1"/>
		<Prp name="computer name" type="S" value="PROG11"/>
		<Prp name="status" type="I" value="0"/>
		<Prp name="user name" type="S" value="Prog11"/>
	</Node>
</Nodes>