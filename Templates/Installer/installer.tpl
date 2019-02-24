<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="_{linkroot}/assets/imgs/logo/favicon.png" type="image/png"/>
    <link rel="shortcut icon" href="_{linkroot}/assets/imgs/logo/favicon.png" type="image/png"/>
    <link href="_{linkroot}/assets/css/Main.min.css" rel="stylesheet" type="text/css">
    <link href="_{linkroot}/assets/css/effects.min.css" rel="stylesheet" type="text/css">
    <link href="_{linkroot}/assets/css/fonts.min.css" rel="stylesheet" type="text/css">
    <link href="_{linkroot}/assets/css/AlbaFoxIcons.min.css" rel="stylesheet" type="text/css">
    <link href="_{linkroot}/assets/css/installer.min.css" rel="stylesheet" type="text/css">
    <title>_{title}</title>
</head>
<body>
    <section id="Wrapper">
        <header class="installer-header">
            <div class="row dFlex dfWrap jc-center">
                <div class="col">
                    <i class="icon-header-installer ais-settings"> </i>
                </div>
            </div>
            <div class="row dFlex dfWrap jc-center">
                <div class="col txt-center">
                    <h1>_{welcome_installer}</h1>
                    <h3>_{follow_steps_to_proceed}</h3>
                </div>
            </div>
            <div class="row">
                <div class="col wp-100">
                    <nav>
                        <ul>
                            _{li_steps}
                        </ul>
                    </nav>
                </div>
            </div>

        </header>
        <div class="container">

            _{content}
        </div>

    </section>
    <script src="_{linkroot}/Js/main.min.js" type="application/javascript"></script>
</body>
</html>
