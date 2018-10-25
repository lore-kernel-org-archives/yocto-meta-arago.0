Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BBE4452988
	for <meta-arago@arago-project.org>;
	Thu, 25 Oct 2018 12:43:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9PCgvfh087589
	for <meta-arago@arago-project.org>; Thu, 25 Oct 2018 07:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1540471377;
	bh=c1+MdDom63ijlZG1npVCe4wdRlJ9QbNahCZ23m/0I/s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Zxo5twVmZKSuUm8/9iIhYqKAtyhJoQcinzmRNH02nI0fHO+uESBIz4jbsqJu2gHeT
	vAJFZASse+nxHkbaItXAaHfl3Apqhx0rTvduoKQaLtxbYZsbmWZ+vPqd2lSqyBzQZE
	CnxXCk2sWs12uqPhLloLTtsRcTlPmglqhdfJ0JTI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9PCgvOU002265
	for <meta-arago@arago-project.org>; Thu, 25 Oct 2018 07:42:57 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 25 Oct 2018 07:42:57 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 25 Oct 2018 07:42:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9PCgvFx007523;
	Thu, 25 Oct 2018 07:42:57 -0500
Date: Thu, 25 Oct 2018 08:42:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20181025124256.GF20070@beryl>
References: <1539878227-19641-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1539878227-19641-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] weston-conf: replace panel-location with panel-position at weston.ini
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
X-List-Received-Date: Thu, 25 Oct 2018 12:43:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

Are you sure this is against meta-arago/rocko?


On Thu, Oct 18, 2018 at 11:57:07AM -0400, Eric Ruei wrote:
> The panel-location has been replaced with panel-position since Weston 2.0.0
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini | 2 +-
>  meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
> index 3fb2018..8a9dd99 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
> @@ -4,7 +4,7 @@ require-input=false
>  [shell]
>  locking=false
>  animation=zoom
> -panel-location=top
> +panel-position=top
>  startup-animation=fade
>  
>  [screensaver]
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
> index a78a843..c0ae9f9 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
> @@ -4,7 +4,7 @@ require-input=false
>  [shell]
>  locking=false
>  animation=zoom
> -panel-location=top
> +panel-position=top
>  startup-animation=fade
>  
>  [screensaver]
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

