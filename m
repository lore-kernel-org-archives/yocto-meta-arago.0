Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 1AC0C52975
	for <meta-arago@arago-project.org>;
	Wed, 28 Feb 2018 18:56:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1SIu975003654
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:56:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519844169;
	bh=8O3/+fCZnJ8+ttgmO/FicglQz6f9uo7NgDs2XjfMF1U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=E6WEgn8ZOfw3USYiidd7KcnQDGMxi5GnZwXPmzeMzTPtoRbQHdJIMk1/AK61VLfPA
	oGauSwA340pG4FaXfjrZYG4XSQXHS/OLp6n1R36Fj+SpsBVVDrh5LmjpARGRR1q30c
	VeuDbrxgyUfQF7blru9szJZ0AI9HOODL//QDkMII=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1SIu9Ed004632
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:56:09 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 28 Feb 2018 12:56:09 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1261.035; Wed, 28 Feb 2018 12:56:09 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/rocko/master][PATCH] maxrix-gui:Update the
	"execute-command" patch to support win_type
Thread-Index: AQHTsMFCFvBylFLI8E+0YepTiI5adaO6KVhQ
Date: Wed, 28 Feb 2018 18:56:09 +0000
Message-ID: <96d3697cd26944b09c85e7fc1a4cb1d7@ti.com>
References: <1519842039-54717-1-git-send-email-e-ruei1@ti.com>
	<20180228182340.GJ22424@edge>
In-Reply-To: <20180228182340.GJ22424@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.39]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/rocko/master][PATCH] maxrix-gui:Update the "execute-command" patch to support win_type
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2018 18:56:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

I do not know the history.
The only advantage that I can see is that we shall apply this patch only wh=
en Weston is built.

Jake: do you know why we do it this way?

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, February 28, 2018 1:24 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [morty/rocko/master][PATCH] maxrix-gui:Update the=
 "execute-command" patch to support win_type

Thanks, this sounds good.

One question I have is - can we push these changes to matrix gui repo inste=
ad of carrying them here in meta-arago metadata?

--
Denys


On Wed, Feb 28, 2018 at 01:20:39PM -0500, Eric Ruei wrote:
> An optional variable win_type can be specified at app.desktop to
> force matrix-gui to exit Weston prior to application launching
>=20
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  ...mmand-workaround-for-GUI-apps-with-weston.patch | 64 +++++++++++++++-=
------
>  .../recipes-core/matrix/matrix-gui_2.0.bb          |  2 +-
>  2 files changed, 44 insertions(+), 22 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execut=
e_command-workaround-for-GUI-apps-with-weston.patch b/meta-arago-extras/rec=
ipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-wi=
th-weston.patch
> index 4dbdbab..5a85935 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_comma=
nd-workaround-for-GUI-apps-with-weston.patch
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_comma=
nd-workaround-for-GUI-apps-with-weston.patch
> @@ -1,27 +1,27 @@
> -From 9169773b546cfea3c829b3c5e79c68c7979ceea4 Mon Sep 17 00:00:00 2001
> -From: Jacob Stiffler <j-stiffler@ti.com>
> -Date: Sat, 13 Aug 2016 13:27:30 -0400
> +From 9647ddc10dc9424b1433db2f8184268523d829da Mon Sep 17 00:00:00 2001
> +From: Eric Ruei <e-ruei1@ti.com>
> +Date: Wed, 28 Feb 2018 12:20:32 -0500
>  Subject: [PATCH] execute_command: workaround for GUI apps with weston
> =20
>  * For all GUI apps, shutdown matrix before launching
>    - This is needed since matrix is launched fullscreen, and another
>      GUI app may get hidden behind matrix with no way to recover.
> -* For MM and 3D apps, shutdown weston before launching
> -  - These apps use KMS sink, which collides with weston.
> +* For MM and 3D and null window apps, shutdown weston before launching
> +  - These apps use KMS sink or DRM, which collides with weston
> =20
>  Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>  Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>  ---
> - execute_command.sh |   34 +++++++++++++++++++++++++++++++++-
> - generate.php       |    2 ++
> - run_script.php     |    2 +-
> - 3 files changed, 36 insertions(+), 2 deletions(-)
> + execute_command.sh | 39 ++++++++++++++++++++++++++++++++++++++-
> + generate.php       |  4 ++++
> + run_script.php     | 10 +++++++++-
> + 3 files changed, 51 insertions(+), 2 deletions(-)
> =20
>  diff --git a/execute_command.sh b/execute_command.sh
> -index 2be1278..b8d98a5 100755
> +index 325dcb9..180e71f 100755
>  --- a/execute_command.sh
>  +++ b/execute_command.sh
> -@@ -59,7 +59,17 @@ do
> +@@ -63,7 +63,22 @@ do
>   	outputfilename=3D$item=20
>     fi
>  =20
> @@ -36,11 +36,16 @@ index 2be1278..b8d98a5 100755
>  +    category=3D$item
>  +  fi
>  +
> -+  if [ $i -gt 3 ]
> ++  if [ $i -eq 4 ]
> ++  then
> ++    win_type=3D$item
> ++  fi
> ++
> ++  if [ $i -gt 4 ]
>     then
>       touch "lock/"$item
>  =20
> -@@ -68,10 +78,32 @@ do
> +@@ -72,10 +87,32 @@ do
>  =20
>   done
>  =20
> @@ -48,7 +53,7 @@ index 2be1278..b8d98a5 100755
>  +then
>  +  /etc/init.d/matrix-gui-2.0 stop
>  +
> -+  if [ $category =3D=3D 3d -o $category =3D=3D multimedia -o $category =
=3D=3D touch ]
> ++  if [ $category =3D=3D 3d -o $category =3D=3D multimedia -o $category =
=3D=3D touch -o $win_type =3D=3D null ]
>  +  then
>  +    /etc/init.d/weston stop
>  +    sleep 1
> @@ -61,7 +66,7 @@ index 2be1278..b8d98a5 100755
>  =20
>  +if [ $program_type =3D=3D gui ]
>  +then
> -+  if [ $category =3D=3D 3d -o $category =3D=3D multimedia -o $category =
=3D=3D touch ]
> ++  if [ $category =3D=3D 3d -o $category =3D=3D multimedia -o $category =
=3D=3D touch -o $win_type =3D=3D null ]
>  +  then
>  +    /etc/init.d/weston start
>  +    sleep 1
> @@ -74,31 +79,48 @@ index 2be1278..b8d98a5 100755
>   echo "_?!!MATRIX_SCRIPT_COMPLETED!!?_" >> "tmp/"$outputfilename
>  =20
>  diff --git a/generate.php b/generate.php
> -index 10cfed4..7c08282 100644
> +index 10cfed4..cd88dd3 100644
>  --- a/generate.php
>  +++ b/generate.php
> -@@ -105,6 +105,8 @@ for($x =3D 0;$x<count($contents)&&strlen($contents[$=
x])>0;$x++)
> +@@ -105,6 +105,10 @@ for($x =3D 0;$x<count($contents)&&strlen($contents[=
$x])>0;$x++)
>   		$top["Description_Link"] =3D get_contents("X-MATRIX-Description",$dot=
desktop);
>  =20
>   		$top["Lock"] =3D get_contents("X-MATRIX-LOCK",$dotdesktop);
>  +
>  +		$top["Category"] =3D get_contents("Categories",$dotdesktop);
> ++
> ++		$top["WinType"] =3D get_contents("WinType",$dotdesktop);
>   	}=20
>  =20
>   	if($category =3D=3D -1)
>  diff --git a/run_script.php b/run_script.php
> -index 9dd7a10..1481b17 100644
> +index 9dd7a10..d34a286 100644
>  --- a/run_script.php
>  +++ b/run_script.php
> -@@ -91,7 +91,7 @@ if($currently_locked=3D=3Dfalse)
> +@@ -55,6 +55,7 @@ $submenu =3D isset($_GET["submenu"]) =3D=3D true ? $_G=
ET["submenu"] : "main_menu" ;
> + $found_app =3D get_application($var,$submenu,$_GET["app"]);
> +=20
> + $lock_list =3D $found_app["Lock"];
> ++$win_type =3D $found_app["WinType"];
> +=20
> + //Verify that there is a lock specified for this application
> + if($lock_list !=3D -1 )
> +@@ -91,7 +92,14 @@ if($currently_locked=3D=3Dfalse)
>   	$random_string =3D strval(rand());
>   	$random_string .=3D strval(rand());
>  =20
>  -	$script_command =3D "./execute_command.sh \"".addslashes($script_link)=
. "\" ".$random_string.".txt ".$lock_list;
> -+	$script_command =3D "./execute_command.sh \"".addslashes($script_link)=
. "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_a=
pp["Category"]."\" ".$lock_list;
> ++        if($win_type !=3D -1 )
> ++	{
> ++		$script_command =3D "./execute_command.sh \"".addslashes($script_link=
). "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_=
app["Category"]."\" \"".$found_app["WinType"]."\"  ".$lock_list;
> ++	}
> ++	else
> ++	{
> ++		$script_command =3D "./execute_command.sh \"".addslashes($script_link=
). "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_=
app["Category"]."\"  \"wayland\" ".$lock_list;
> ++	}
>  =20
>   	$last_line =3D system($script_command." > /dev/null 2>/dev/null & ", $=
retval);
>   }
>  --=20
> -1.7.9.5
> +1.9.1
> =20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/me=
ta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index 2bd0d89..21f5b18 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da886c9ef769b2d=
8271115d2502512e5d"
> =20
>  SECTION =3D "multimedia"
> =20
> -PR =3D "r33"
> +PR =3D "r34"
> =20
>  INITSCRIPT_NAME =3D "matrix-gui-2.0"
>  INITSCRIPT_PARAMS =3D "defaults 97"
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

