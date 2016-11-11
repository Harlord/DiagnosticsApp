# DiagnosticsApp

Para probrar la aplicación en el simiulador basta descargarla y ejecutarla. 
Las librerías Pods que se están usando se están incluendo en el repositorio según recomiendan en [**Should I check the Pods directory into source control?**](https://guides.cocoapods.org/using/using-cocoapods.html#should-i-check-the-pods-directory-into-source-control) por lo que no es necesario descargarlas, las usadas son las siguientes:

  **Signals** Usado para acceder fácilmente a los eventos de controles.
  
  **RealmSwift** Usado para almacenar localmente los resultados de diagnósticos por pacientes.

Fue incluido el test **testUI()** para UI en en target **DiagnosticsApp** DiagnosticsAppUITests > DiagnosticsAppUITests 

Fueron inclidos los tests **testDiagnosticFullLikelihood()** y **testDiagnosticIncompleteLikelihood()** para probar la lógica del diagnóstico en el target **DiagnosticsCore** DiagnosticsCoreTests > DiagnosticsCoreTests

Las llamadas a la logica de guardar y listar datos implementan el protocolo **PatientDataSource** con las fuciones **save(patient: Patient)** y **func list() -> [Patient]** para guardar y listar los resultados, este protocolo se implementa en **PatientLocalStore** para manejar la lógica de almacén de datos local y en **PatientCloudStore** para una futura implementación consumiendo un API REST

La los metodos requeridos en la API serían:

**POST /patient** para guardar el resultado con los parametros JSON:

	{
  		"patinent": {
    		"name": "User Name",
    		"likelihood": 50
  		}
	}

**GET /patient** para listar los resultados con el JSON:

	[
  		{
    		"patinent": {
      			"name": "User Name",
      			"likelihood": 50
    		}
  		}
	]
