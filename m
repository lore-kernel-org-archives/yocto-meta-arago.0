Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 1CC1C52A1F
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 14:50:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GEo8nE030014
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 09:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489675808;
	bh=sSCnNpTNmHJK2JVu6wyk8Ax/g5tWOepUz5scVe4pj+E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JM/iVLdNyBVXocspsJX2adlFT/EMGKa74I9ixC/K5kfUsRz+lWXIrXJjKYsw8HbIq
	k3A/4Gd6JS3ZmJwRrwEdUw13ZFK01/+hXdR0CEOdodM8o6NqbJSi04ccH9+3b7TdeT
	cHciKxxEAPtbDhigamvGWJ52/Gk8x2GJnxFwZViE=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GEo8J2017165
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 09:50:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 09:50:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GEo7Bs026930;
	Thu, 16 Mar 2017 09:50:07 -0500
Date: Thu, 16 Mar 2017 10:50:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20170316145007.GB14484@edge>
References: <1489665224-95346-1-git-send-email-a0393906@ti.com>
	<1489665224-95346-2-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1489665224-95346-2-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty] glsdk-example-apps: Include fix for HDMI testcases
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
X-List-Received-Date: Thu, 16 Mar 2017 14:50:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, Mar 16, 2017 at 05:23:43PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> index 94c1362..3d3e155 100644
> --- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> +++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> @@ -14,9 +14,9 @@ inherit autotools pkgconfig
>  SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
>  	 "
>  
> -SRCREV="8384727bef3368b95b690dd50e6735c9344a8590"
> +SRCREV="f7562ecf76c559972205d7faaa3b50bdb43de238"
>  
> -PR = "r47"
> +PR = "r49"
>  
>  do_install_append () {
>      install -d ${D}${sysconfdir}/glsdkstatcoll
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

