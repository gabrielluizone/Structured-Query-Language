CREATE TABLE cliente (
    cpf_cliente INTEGER PRIMARY KEY,
    mn_cliente VARCHAR(64) NOT NULL,
		cd_mail VARCHAR(64),
    cd_telefone VARCHAR(15)
)

CREATE TABLE veiculo (
    cd_placa CHAR(10) PRIMARY KEY,
    nm_marca VARCHAR(30) DEFAULT 'FORD',
    nm_modelo VARCHAR(30),
    aa_veiculo NUMBER(4),
    cd_cpf INTEGER,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (cd_cpf) REFERENCES cliente (cpf_cliente)
)
   
CREATE TABLE licenciamento (
    dt_licenciamento DATE,
    cd_placa CHAR(10),
    CONSTRAINT licenciamento_pk PRIMARY KEY (dt_licenciamento, cd_placa),
    CONSTRAINT licenciamento_veiculo_fk FOREIGN KEY (cd_placa) REFERENCES veiculo (cd_placa)
)
/* Estrutura da tabela */
DESC veiculo
DESC cliente
DESC licenciamento

/* Alternatar a tabela */
ALTER TABLE licenciamento ADD vl_licenciamento NUMBER(10, 2)

/* ---------------- */
SELECT TABLE_NAME FROM USER_TABLES
