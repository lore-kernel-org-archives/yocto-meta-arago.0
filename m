Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 85DE652986
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2019 01:20:54 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBA1JK9v128883
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 19:19:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575940760;
	bh=8NplIctUQk+fhGfxj+CLpmQli8zvPuLB4SKBrVv4+2Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=I0h7ii5iIcbdIOao7V4EblHkJLOLRJJYkh2JuxBhRSxz3oaBgW8HZeo3K9znkH0jP
	u4WQ1INDBZ+lp4nSbGUC7LN1DLN/TWBH5Cgru/7kDl1mqlxAa2gXh73+BMiqWGYwX5
	vl3p4v+4pHTxOFAHuO1WAJ3SV658xEDav+hZNmyc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBA1JKLi044963
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 19:19:20 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 9 Dec 2019 19:19:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 9 Dec 2019 19:19:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBA1JJPb040966;
	Mon, 9 Dec 2019 19:19:20 -0600
Date: Mon, 9 Dec 2019 20:19:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20191210011919.GB11226@beryl>
References: <1575880358-112711-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1575880358-112711-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master][PATCH v2] Rules.make: Initialie DESTDIR and EXEC_DIR conditionally
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
X-List-Received-Date: Tue, 10 Dec 2019 01:20:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This is fine with me, as long as Jake takes the tisdk-setup-scripts patch.


On Mon, Dec 09, 2019 at 02:02:38PM +0530, Nikhil Devshatwar wrote:
> DESTDIR and EXEC_DIR in the Rules.make point to the paths where
> the files should be installed.
> 
> Initialize the conditionally so that command line override is
> allowed. This is useful when you want to switch between NFS rootfs
> and SD card rootfs.
> e.g. Following can be done now from installer.
> 
> $> DESTDIR=/path/to/sd/card make install #custom installation
> $>                          make install #NFS installation
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
> index 96f248a..a2b7769 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
> @@ -14,7 +14,7 @@ UBOOT_MACHINE=__UBOOT_MACHINE__
>  export TI_SDK_PATH=__SDK__INSTALL_DIR__
>  
>  #root of the target file system for installing applications
> -DESTDIR=__DESTDIR__
> +DESTDIR ?=__DESTDIR__
>  
>  #Points to the root of the Linux libraries and headers matching the
>  #demo file system.
> @@ -42,4 +42,4 @@ SDK_PATH_TARGET=$(TI_SDK_PATH)/__SDK_PATH_TARGET__
>  
>  # Set EXEC_DIR to install example binaries.
>  # This will be configured with the setup.sh script.
> -EXEC_DIR=__EXEC_DIR__
> +EXEC_DIR ?=__EXEC_DIR__
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

