<?php 

	class conectar{
		private $servidor="sql206.byethost8.com";
		private $usuario="b8_33089771";
		private $password="Seara7808";
		private $bd="b8_33089771_seara";

		public function conexion(){
			$conexion=mysqli_connect($this->servidor,
									 $this->usuario,
									 $this->password,
									 $this->bd);
			return $conexion;
		}
	}


 ?>
