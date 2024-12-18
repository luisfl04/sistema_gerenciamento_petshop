-- IMPLEMENTANDO VIEWS:

-- CRIANDO VIEW QUE SELECIONA RETORNA O OBJETO 'CLIENTE' E O 'PET' RELACIONADO A ELE:
CREATE VIEW EXIBIR_CLIENTE_E_PET AS
SELECT C.NOME_COMPLETO AS NOME, P.NOME_DO_PET
FROM CLIENTE C, PET P
WHERE C.ID_CLIENTE = P.DONO_DO_PET;