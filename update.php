<?php
// Include config file
require_once "config.php";

// Define variables and initialize with empty values
$idKaryawan = $gambar = $namaKaryawan = $tanggalLahirKaryawan = $idAsal = $teleponKaryawan = $tanggalMasukKaryawan = $statusKaryawan = $keterangan = "";
$idKaryawan_err = $gambar_err = $namaKaryawan_err = $tanggalLahirKaryawan_err = $idAsal_err = $teleponKaryawan_err = $tanggalMasukKaryawan_err = $statusKaryawan_err = $keterangan_err = "";

// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    // Validate idKaryawan
    $input_idKaryawan = trim($_POST["idKaryawan"]);
    if(empty($input_idKaryawan)){
        $idKaryawan_err = "Please enter a id.";
    } else{
        $idKaryawan = $input_idKaryawan;
    }

    // Validate gambar
    $input_gambar = trim($_POST["gambar"]);
    if(empty($input_gambar)){
        $gambar_err = "Please enter a pict.";
    } else{
        $gambar = $input_gambar;
    }

    // Validate namaKaryawan
    $input_namaKaryawan = trim($_POST["namaKaryawan"]);
    if(empty($input_namaKaryawan)){
        $namaKaryawan_err = "Please enter a namaKaryawan.";
    } elseif(!filter_var($input_namaKaryawan, FILTER_VALIDATE_REGEXP, array("options"=>array("regexp"=>"/^[a-zA-Z\s]+$/")))){
        $namaKaryawan_err = "Please enter a valid namaKaryawan.";
    } else{
        $namaKaryawan = $input_namaKaryawan;
    }

    // Validate tanggalLahirKaryawan
    $input_tanggalLahirKaryawan = trim($_POST["tanggalLahirKaryawan"]);
    if(empty($input_tanggalLahirKaryawan)){
        $tanggalLahirKaryawan_err = "Please enter an birth date.";
    } else{
        $tanggalLahirKaryawan = $input_tanggalLahirKaryawan;
    }

    // Validate idAsal
    $input_idAsal = trim($_POST["idAsal"]);
    if(empty($input_idAsal)){
        $idAsal_err = "Please enter the district.";
    } else{
        $idAsal = $input_idAsal;
    }

    // Validate teleponKaryawan
    $input_teleponKaryawan = trim($_POST["teleponKaryawan"]);
    if(empty($input_teleponKaryawan)){
        $teleponKaryawan_err = "Please enter the telepphone.";
    } elseif(!filter_var($input_teleponKaryawan, FILTER_VALIDATE_REGEXP, array("options"=>array("regexp"=>"/^[a-zA-Z\s]+$/")))){
        $namaKaryawan_err = "Please enter a valid telephone.";
    } else{
        $teleponKaryawan = $input_teleponKaryawan;
    }

    // Validate tanggal masuk
    $input_tanggalMasukKaryawan = trim($_POST["tanggalMasukKaryawan"]);
    if(empty($input_tanggalMasukKaryawan)){
        $tanggalMasukKaryawan_err = "Please enter the employee entry date.";
    } else{
        $tanggalMasukKaryawan = $input_tanggalMasukKaryawan;
    }

    // Validate statusKaryawan
    $input_statusKaryawan = trim($_POST["statusKaryawan"]);
    if(empty($input_statusKaryawan)){
        $statusKaryawan_err = "Please enter the employee statusKaryawan.";
    } else{
        $statusKaryawan = $input_statusKaryawan;
    }

    // Validate keterangan
    $input_keterangan = trim($_POST["keterangan"]);
    if(empty($input_keterangan)){
        $keterangan_err = "Please enter the employee statusKaryawan description.";
    } else{
        $keterangan = $input_keterangan;
    }

    // Check input errors before inserting in database
    if(empty($idKaryawan_err) && $gambar_err) && $namaKaryawan_err) && empty($tanggalLahirKaryawan_err) && empty($idAsal_err) && empty($teleponKaryawan_err) && empty($tanggalMasukKaryawan_err) && empty($statusKaryawan_err) && empty($keterangan_err){
        // Prepare an insert statement
        $sql = "INSERT INTO karyawan_administrasi (idKaryawan, gambar, namaKaryawan, tanggalLahirKaryawan, idAsal, teleponKaryawan, tanggalMasukKaryawan, statusKaryawan, keterangan) VALUES (?, ?, ?,?, ?, ?, ?)";

        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "sss", $param_idKaryawan, $param_gambar, $param_namaKaryawan, $param_tanggalLahirKaryawan, $param_idAsal, $param_teleponKaryawan, $param_tanggalMasukKaryawan, $param_statusKaryawan, $param_keterangan);

            // Set parameters
            $param_idKaryawan = $idKaryawan
            $param_gambar = $gambar
            $param_namaKaryawan = $namaKaryawan;
            $param_tanggalLahirKaryawan = $tanggalLahirKaryawan;
            $param_idAsal = $idAsal;
            $param_teleponKaryawan = $teleponKaryawan;
            $param_tanggalMasukKaryawan = $tanggalMasukKaryawan;
            $param_statusKaryawan = $statusKaryawan;
            $param_keterangan = $keterangan;

            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Records created successfully. Redirect to landing page
                header("location: index.php");
                exit();
            } else{
                echo "Something went wrong. Please try again later.";
            }
        }

        // Close statement
        mysqli_stmt_close($stmt);
    }

    // Close connection
    mysqli_close($link);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Record</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        .wrapper{
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h2>Tambahkan Data Karyawan</h2>
                    </div>
                    <p>Silahkan isi form di bawah ini kemudian submit untuk menambahkan data pegawai ke dalam database.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="form-group <?php echo (!empty($idKaryawan_err)) ? 'has-error' : ''; ?>">
                            <label>Nama</label>
                            <input type="text" idKaryawan="idKaryawan" class="form-control" value="<?php echo $idKaryawan; ?>">
                            <span class="help-block"><?php echo $idKaryawan_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($gambar_err)) ? 'has-error' : ''; ?>">
                            <label>Nama</label>
                            <input type="text" gambar="gambar" class="form-control" value="<?php echo $gambar; ?>">
                            <span class="help-block"><?php echo $gambar_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($name_err)) ? 'has-error' : ''; ?>">
                            <label>Nama</label>
                            <input type="text" nama="nama" class="form-control" value="<?php echo $name; ?>">
                            <span class="help-block"><?php echo $name_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($tanggalLahirKaryawan_err)) ? 'has-error' : ''; ?>">
                            <label>tanggalLahirKaryawan</label>
                            <input type="text" tanggalLahirKaryawan="tanggalLahirKaryawan" class="form-control"><?php echo $tanggalLahirKaryawan; ?></textarea>
                            <span class="help-block"><?php echo $tanggalLahirKaryawan_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($idAsal_err)) ? 'has-error' : ''; ?>">
                            <label>idAsal</label>
                            <input type="text" idAsal="idAsal" class="form-control" value="<?php echo $idAsal; ?>">
                            <span class="help-block"><?php echo $idAsal_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($teleponKaryawan_err)) ? 'has-error' : ''; ?>">
                            <label>teleponKaryawan</label>
                            <input type="text" teleponKaryawan="teleponKaryawan" class="form-control" value="<?php echo $teleponKaryawan; ?>">
                            <span class="help-block"><?php echo $teleponKaryawan_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($tanggalMasukKaryawan_err)) ? 'has-error' : ''; ?>">
                            <label>tanggalMasukKaryawan</label>
                            <input type="text" tanggalMasukKaryawan="tanggalMasukKaryawan" class="form-control" value="<?php echo $tanggalMasukKaryawan; ?>">
                            <span class="help-block"><?php echo $tanggalMasukKaryawan_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($statusKaryawan_err)) ? 'has-error' : ''; ?>">
                            <label>statusKaryawan</label>
                            <input type="text" statusKaryawan="statusKaryawan" class="form-control" value="<?php echo $statusKaryawan; ?>">
                            <span class="help-block"><?php echo $statusKaryawan_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($keterangan_err)) ? 'has-error' : ''; ?>">
                            <label>keterangan</label>
                            <input type="text" keterangan="keterangan" class="form-control" value="<?php echo $keterangan; ?>">
                            <span class="help-block"><?php echo $keterangan_err;?></span>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Submit">
                        <a href="index.php" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
