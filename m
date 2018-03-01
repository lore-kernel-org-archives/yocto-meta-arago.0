Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id DB23B52976
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:00:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21J0MnY023634
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:00:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519930822;
	bh=NqyDdytxyDqpuA9AlC5ucZcEh2fSxGpqIEi2Myiq0eg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kKZ+JecxZjAyTf0GM8SaXWRwq0hP91Svg4Q+us8sfi0/J3DSCk710rAlleV+ga34K
	fJsWqXD12TFt2b1o2xJKSk5Kf+1tBqd5jpdNSilRZ1yJoOqbAazdeoGzUZrzcFXUtP
	VFQXIxBydPG6d56GGPehFv0iF17IiNPbCtz647Z4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21J0LbV024119
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:00:21 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:00:21 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 13:00:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21J0LDr029446;
	Thu, 1 Mar 2018 13:00:21 -0600
Date: Thu, 1 Mar 2018 14:00:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180301190020.GN22424@edge>
References: <1519916131-7750-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1519916131-7750-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-setup-scripts][PATCH] setup-package-install: select u-boot-tools for Ubuntu 16.04
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
X-List-Received-Date: Thu, 01 Mar 2018 19:00:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

ACK

On Thu, Mar 01, 2018 at 09:55:31AM -0500, Jacob Stiffler wrote:
> And fix potential issue in detection of required package status as
> "dpkg-query -l" will list matching packages available on the system,
> but not the intallation status as "dpkg-query -s" does.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  setup-package-install.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/setup-package-install.sh b/setup-package-install.sh
> index 1ef94f9..c5c134f 100644
> --- a/setup-package-install.sh
> +++ b/setup-package-install.sh
> @@ -63,7 +63,7 @@ get_host_type host
>  # Starting with Ubuntu 14.04 the package name for uboot-mkimage has changed
>  # to u-boot-tools
>  
> -if [ "$host" = "trusty" ]; then
> +if [ "$host" = "trusty" -o "$host" = "xenial" ]; then
>      packages_to_install="$packages_to_install u-boot-tools"
>  else
>      packages_to_install="$packages_to_install uboot-mkimage"
> @@ -74,7 +74,7 @@ cmd="sudo apt-get install "
>  
>  # Check and only install the missing packages
>  for i in $packages_to_install; do
> -	is_it_installed=`dpkg-query -l $i 2>/dev/null`
> +	is_it_installed=`dpkg-query -s $i 2>/dev/null`
>  	if [ "$?" -ne "0" ]; then
>  		needs_installation=`echo $needs_installation`" "$i
>  		new_cmd=`echo $cmd`" "$i
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

