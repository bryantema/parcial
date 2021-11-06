import 'package:flutter/material.dart';

class InputMascotas extends StatefulWidget {
  @override
  _InputMascotasState createState() => _InputMascotasState();
}
class _InputMascotasState extends State<InputMascotas> {

  String _nombre_mascota = '';
  String _nombre_duenio  = '';
  String _telefono  = '';
  String _raza  = '';
  String _edad_mascota  = '';
  String _tipo_mascota  = '';
  String _fecha_nacimiento_mascota  = '';

  String _opcionSeleccionada = 'Macho';

  List<String> _sexo = ['Macho', 'Hembra', 'Le mascote'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ficha de mascota'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crear_nombre_mascota(),
          Divider(),
          _crear_nombre_duenio(),
          Divider(),
          _crear_telefono(),
          Divider(),
          _crear_raza(),
          Divider(),
          _crearsexo(),
          Divider(),
          _crear_edad_mascota(),
          Divider(),
          _crear_tipo_mascota(),
          Divider(),
          _crear_fecha_nacimiento_mascota(context),
          Divider(),
          _crearfichamascota()
        ],
      ),
    );
  }

  
Widget _crear_nombre_mascota() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _nombre_mascota.length }'),
        hintText: 'Nombre de la mascota',
        labelText: 'Nombre de la mascota',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState(() {
          _nombre_mascota = valor;
        });
      },
    );

  }
  Widget _crear_nombre_duenio() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _nombre_duenio.length }'),
        hintText: 'Nombre del dueño',
        labelText: 'Nombre del dueño',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState(() {
          _nombre_duenio  = valor;
        });
      },
    );

  }
  Widget _crear_telefono() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _telefono.length }'),
        hintText: 'Teléfono',
        labelText: 'Teléfono',
        helperText: 'Sólo es el teléfono',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState(() {
          _telefono  = valor;
        });
      },
    );

  }
  Widget _crear_raza() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _raza.length }'),
        hintText: 'Raza',
        labelText: 'Raza',
        helperText: 'Sólo es la raza',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState(() {
          _raza   = valor;
        });
      },
    );

  }

   List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _sexo.forEach( (sexo){

      lista.add( DropdownMenuItem(
        child: Text(sexo),
        value: sexo,
      ));

    });

    return lista;

  }

  Widget _crearsexo() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),   
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )

      ],
    );
    

  }

   Widget _crear_edad_mascota() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _edad_mascota.length }'),
        hintText: 'Edad mascota',
        labelText: 'Edad mascota',
        helperText: 'Sólo es la edad',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState(() {
          _edad_mascota  = valor;
        });
      },
    );

  }
   Widget  _crear_tipo_mascota() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _tipo_mascota.length }'),
        hintText: 'tipo mascota',
        labelText: 'tipo mascota',
        helperText: 'Tipo',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState(() {
          _tipo_mascota   = valor;
        });
      },
    );

  }

  
  Widget _crear_fecha_nacimiento_mascota( BuildContext context ) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today )
      ),
      onTap: (){ 

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );

      },
    );

  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1983),
      lastDate: new DateTime.now(),
      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
          _fecha_nacimiento_mascota = picked.toString();
          _inputFieldDateController.text = _fecha_nacimiento_mascota;
      }); 
    }

  }



  Widget _crearfichamascota() {

    return ListTile(
      title: Text('El nombre de la mascota es: $_nombre_mascota'),
      subtitle: Text('El tipo de mascota es: $_tipo_mascota '),
      trailing: Text(_opcionSeleccionada),
    );

  }

}