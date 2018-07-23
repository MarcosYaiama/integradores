from sqlalchemy import (create_engine, 
                        MetaData, 
                        Column, 
                        Table, 
                        Integer, 
                        String, 
                        DateTime)

engine = create_engine('sqlite:///integradores.db', echo=False)

metadata = MetaData(bind=engine)

user_table = Table('usuarios', metadata,
                  Column(('id'), Integer, primary_key=True),
                  Column(('nome'), String(40)),
                  Column(('senha'), String),
                  Column(('cargo'), String(15)))

metadata.create_all()