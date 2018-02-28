Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 36F0252975
	for <meta-arago@arago-project.org>;
	Wed, 28 Feb 2018 18:24:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1SINfeY010420
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:23:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519842221;
	bh=kRIoInX4iMj5biOamlmMe+R6JpxpnhOSdCFor+wpY/M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UQUB17t9S+Rhn+XYXKhSpPdHxoFhVRDRcmbrKI37fbb3ZRaG+a8cStwHmg8+S6fGq
	JmaljEBwRVgw8QG12QU6UXlU8O0tsumRMIBYGQ9C/qRbqjC7HHnz2f8aZR4+nIDVVl
	q9BuzUAqonTKRx9qTrrLWL2YCxdyxMZnQFpOduv4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1SINfkr014858
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:23:41 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 28 Feb 2018 12:23:41 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 28 Feb 2018 12:23:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1SINewJ031195;
	Wed, 28 Feb 2018 12:23:40 -0600
Date: Wed, 28 Feb 2018 13:23:40 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20180228182340.GJ22424@edge>
References: <1519842039-54717-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1519842039-54717-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Wed, 28 Feb 2018 18:24:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, this sounds good.

One question I have is - can we push these changes to matrix gui repo instead 
of carrying them here in meta-arago metadata?

-- 
Denys


On Wed, Feb 28, 2018 at 01:20:39PM -0500, Eric Ruei wrote:
> An optional variable win_type can be specified at app.desktop to
> force matrix-gui to exit Weston prior to application launching
> 
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  ...mmand-workaround-for-GUI-apps-with-weston.patch | 64 +++++++++++++++-------
>  .../recipes-core/matrix/matrix-gui_2.0.bb          |  2 +-
>  2 files changed, 44 insertions(+), 22 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
> index 4dbdbab..5a85935 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
> @@ -1,27 +1,27 @@
> -From 9169773b546cfea3c829b3c5e79c68c7979ceea4 Mon Sep 17 00:00:00 2001
> -From: Jacob Stiffler <j-stiffler@ti.com>
> -Date: Sat, 13 Aug 2016 13:27:30 -0400
> +From 9647ddc10dc9424b1433db2f8184268523d829da Mon Sep 17 00:00:00 2001
> +From: Eric Ruei <e-ruei1@ti.com>
> +Date: Wed, 28 Feb 2018 12:20:32 -0500
>  Subject: [PATCH] execute_command: workaround for GUI apps with weston
>  
>  * For all GUI apps, shutdown matrix before launching
>    - This is needed since matrix is launched fullscreen, and another
>      GUI app may get hidden behind matrix with no way to recover.
> -* For MM and 3D apps, shutdown weston before launching
> -  - These apps use KMS sink, which collides with weston.
> +* For MM and 3D and null window apps, shutdown weston before launching
> +  - These apps use KMS sink or DRM, which collides with weston
>  
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
>  
>  diff --git a/execute_command.sh b/execute_command.sh
> -index 2be1278..b8d98a5 100755
> +index 325dcb9..180e71f 100755
>  --- a/execute_command.sh
>  +++ b/execute_command.sh
> -@@ -59,7 +59,17 @@ do
> +@@ -63,7 +63,22 @@ do
>   	outputfilename=$item 
>     fi
>   
> @@ -36,11 +36,16 @@ index 2be1278..b8d98a5 100755
>  +    category=$item
>  +  fi
>  +
> -+  if [ $i -gt 3 ]
> ++  if [ $i -eq 4 ]
> ++  then
> ++    win_type=$item
> ++  fi
> ++
> ++  if [ $i -gt 4 ]
>     then
>       touch "lock/"$item
>   
> -@@ -68,10 +78,32 @@ do
> +@@ -72,10 +87,32 @@ do
>   
>   done
>   
> @@ -48,7 +53,7 @@ index 2be1278..b8d98a5 100755
>  +then
>  +  /etc/init.d/matrix-gui-2.0 stop
>  +
> -+  if [ $category == 3d -o $category == multimedia -o $category == touch ]
> ++  if [ $category == 3d -o $category == multimedia -o $category == touch -o $win_type == null ]
>  +  then
>  +    /etc/init.d/weston stop
>  +    sleep 1
> @@ -61,7 +66,7 @@ index 2be1278..b8d98a5 100755
>   
>  +if [ $program_type == gui ]
>  +then
> -+  if [ $category == 3d -o $category == multimedia -o $category == touch ]
> ++  if [ $category == 3d -o $category == multimedia -o $category == touch -o $win_type == null ]
>  +  then
>  +    /etc/init.d/weston start
>  +    sleep 1
> @@ -74,31 +79,48 @@ index 2be1278..b8d98a5 100755
>   echo "_?!!MATRIX_SCRIPT_COMPLETED!!?_" >> "tmp/"$outputfilename
>   
>  diff --git a/generate.php b/generate.php
> -index 10cfed4..7c08282 100644
> +index 10cfed4..cd88dd3 100644
>  --- a/generate.php
>  +++ b/generate.php
> -@@ -105,6 +105,8 @@ for($x = 0;$x<count($contents)&&strlen($contents[$x])>0;$x++)
> +@@ -105,6 +105,10 @@ for($x = 0;$x<count($contents)&&strlen($contents[$x])>0;$x++)
>   		$top["Description_Link"] = get_contents("X-MATRIX-Description",$dotdesktop);
>   
>   		$top["Lock"] = get_contents("X-MATRIX-LOCK",$dotdesktop);
>  +
>  +		$top["Category"] = get_contents("Categories",$dotdesktop);
> ++
> ++		$top["WinType"] = get_contents("WinType",$dotdesktop);
>   	} 
>   
>   	if($category == -1)
>  diff --git a/run_script.php b/run_script.php
> -index 9dd7a10..1481b17 100644
> +index 9dd7a10..d34a286 100644
>  --- a/run_script.php
>  +++ b/run_script.php
> -@@ -91,7 +91,7 @@ if($currently_locked==false)
> +@@ -55,6 +55,7 @@ $submenu = isset($_GET["submenu"]) == true ? $_GET["submenu"] : "main_menu" ;
> + $found_app = get_application($var,$submenu,$_GET["app"]);
> + 
> + $lock_list = $found_app["Lock"];
> ++$win_type = $found_app["WinType"];
> + 
> + //Verify that there is a lock specified for this application
> + if($lock_list != -1 )
> +@@ -91,7 +92,14 @@ if($currently_locked==false)
>   	$random_string = strval(rand());
>   	$random_string .= strval(rand());
>   
>  -	$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt ".$lock_list;
> -+	$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_app["Category"]."\" ".$lock_list;
> ++        if($win_type != -1 )
> ++	{
> ++		$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_app["Category"]."\" \"".$found_app["WinType"]."\"  ".$lock_list;
> ++	}
> ++	else
> ++	{
> ++		$script_command = "./execute_command.sh \"".addslashes($script_link). "\" ".$random_string.".txt \"".$found_app["ProgramType"]."\" \"".$found_app["Category"]."\"  \"wayland\" ".$lock_list;
> ++	}
>   
>   	$last_line = system($script_command." > /dev/null 2>/dev/null & ", $retval);
>   }
>  -- 
> -1.7.9.5
> +1.9.1
>  
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index 2bd0d89..21f5b18 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
>  
>  SECTION = "multimedia"
>  
> -PR = "r33"
> +PR = "r34"
>  
>  INITSCRIPT_NAME = "matrix-gui-2.0"
>  INITSCRIPT_PARAMS = "defaults 97"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

