Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3CE3A52981
	for <meta-arago@arago-project.org>;
	Thu,  8 Nov 2018 15:57:58 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA8FvmWX115569
	for <meta-arago@arago-project.org>; Thu, 8 Nov 2018 09:57:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1541692668;
	bh=o1382mlni+c19tsYv+mcR5XTCqvU3rifd9pxJuYcG1Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fTUh1cgrz4PKM3VobB8KgYpCkEfo4ovtc9zn9Lem2BoGSc5muVj4MkwGZ2cp8+RQh
	4qHjHKe/K2qF3+Ursuf0z/yha8Aj2WGJAKRlAL7mNvGACjClw5dKMpg2Kwn6P9Hx6G
	2LNJkmrYqCTzqwESzEHTzbf9N88eEBPbpFh8PP9k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA8Fvmmt021723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 8 Nov 2018 09:57:48 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 8 Nov 2018 09:57:48 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 8 Nov 2018 09:57:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA8FvlBT006973;
	Thu, 8 Nov 2018 09:57:48 -0600
Date: Thu, 8 Nov 2018 10:57:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20181108155747.GA23053@beryl>
References: <1541624710-59127-1-git-send-email-e-ruei1@ti.com>
	<64d6cb22d8a14a2f97f52d1ff8a2fbaf@ti.com>
MIME-Version: 1.0
In-Reply-To: <64d6cb22d8a14a2f97f52d1ff8a2fbaf@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [PATCH] matrix-gui: sleep 1 second prior to weston shutdown
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
X-List-Received-Date: Thu, 08 Nov 2018 15:57:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=f026e412d763889250be2b99b08f5f5c86338f19


On Thu, Nov 08, 2018 at 02:40:09PM +0000, Ruei, Eric wrote:
> NAK
> 
> Please ignore this one. There is a better solution!
> 
> Best regards,
> 
> Eric
> 
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Ruei, Eric
> Sent: Wednesday, November 07, 2018 4:05 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [PATCH] matrix-gui: sleep 1 second prior to weston shutdown
> 
> Update execute_command.sh:
> Wait 1 second to make sure the application freeing all SGX
> resources prior to weston shutdown
> 
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  ...e_command-workaround-for-GUI-apps-with-weston.patch | 18 ++++++++++--------
>  .../recipes-core/matrix/matrix-gui_2.0.bb              |  2 +-
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
> index 5a85935..90a604e 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch
> @@ -1,6 +1,6 @@
> -From 9647ddc10dc9424b1433db2f8184268523d829da Mon Sep 17 00:00:00 2001
> -From: Eric Ruei <e-ruei1@ti.com>
> -Date: Wed, 28 Feb 2018 12:20:32 -0500
> +From 156ce8d8d9ee1b614b0079e1e9506af1835bdab7 Mon Sep 17 00:00:00 2001
> +From: Jacob Stiffler <j-stiffler@ti.com>
> +Date: Wed, 7 Nov 2018 15:48:47 -0500
>  Subject: [PATCH] execute_command: workaround for GUI apps with weston
>  
>  * For all GUI apps, shutdown matrix before launching
> @@ -8,17 +8,18 @@ Subject: [PATCH] execute_command: workaround for GUI apps with weston
>      GUI app may get hidden behind matrix with no way to recover.
>  * For MM and 3D and null window apps, shutdown weston before launching
>    - These apps use KMS sink or DRM, which collides with weston
> -
> +  - Wait 1 second to make sure the application freeing all SGX resources
> +    prior to weston shutdown
>  Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>  Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>  ---
> - execute_command.sh | 39 ++++++++++++++++++++++++++++++++++++++-
> + execute_command.sh | 40 +++++++++++++++++++++++++++++++++++++++-
>   generate.php       |  4 ++++
>   run_script.php     | 10 +++++++++-
> - 3 files changed, 51 insertions(+), 2 deletions(-)
> + 3 files changed, 52 insertions(+), 2 deletions(-)
>  
>  diff --git a/execute_command.sh b/execute_command.sh
> -index 325dcb9..180e71f 100755
> +index 325dcb9..b8bb6da 100755
>  --- a/execute_command.sh
>  +++ b/execute_command.sh
>  @@ -63,7 +63,22 @@ do
> @@ -45,7 +46,7 @@ index 325dcb9..180e71f 100755
>     then
>       touch "lock/"$item
>   
> -@@ -72,10 +87,32 @@ do
> +@@ -72,10 +87,33 @@ do
>   
>   done
>   
> @@ -55,6 +56,7 @@ index 325dcb9..180e71f 100755
>  +
>  +  if [ $category == 3d -o $category == multimedia -o $category == touch -o $win_type == null ]
>  +  then
> ++    sleep 1
>  +    /etc/init.d/weston stop
>  +    sleep 1
>  +  fi
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index d8aa00b..4e335e7 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
>  
>  SECTION = "multimedia"
>  
> -PR = "r35"
> +PR = "r36"
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
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

