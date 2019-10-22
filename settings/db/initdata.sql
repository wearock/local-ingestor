insert into ibex.server(name,host_name,http_port,https_port,default_scheme) values 
('Upload','10.20.0.95','9999','443','https'),
('UploadLogs','10.20.0.95','9999','443','https');

insert into ibex.upload_settings(client_id,name,value) values 
(1,'Upload.server_url',''),
(2,'Upload.server_url',''),
(3,'Upload.server_url',''),
(4,'Upload.server_url',''),
(5,'Upload.server_url',''),
(6,'Upload.server_url',''),
(7,'Upload.server_url',''),
(8,'Upload.server_url',''),
(9,'Upload.server_url',''),
(10,'Upload.server_url','');