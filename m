Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 05BF0529D3
	for <meta-arago@arago-project.org>;
	Tue, 12 Sep 2017 02:26:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8C2PxYj025175
	for <meta-arago@arago-project.org>; Mon, 11 Sep 2017 21:25:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505183159;
	bh=U1gnlEWcvz/R+hwbc0/6bMuJJ9ElMdPYCnQX8msSVR8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=u210RgclEDd9fe2Fk48AkBNrJzS+HM1RJPZ1PV6v717wpdLS9vGLB89Eyo6JHqajQ
	XqcoSosyIBeiLySgqCRCZXklQZD8nYnFmbj/LxMcPpQ5lRtK8q+hHChWFbLvxe56S/
	G5qo06NR5WLKdmHSQxSkz8Sin4x1Zn+o2kjDGxJ4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8C2PrpV023307
	for <meta-arago@arago-project.org>; Mon, 11 Sep 2017 21:25:53 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 11 Sep 2017 21:25:53 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 11 Sep 2017 21:25:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8C2Pr2E013686;
	Mon, 11 Sep 2017 21:25:53 -0500
Date: Mon, 11 Sep 2017 22:25:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20170912022548.GT8304@edge>
References: <20170901205107.25462-1-manisha.agrawal@ti.com>
	<20170901205107.25462-2-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170901205107.25462-2-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v1 2/6] matrix-gui-apps-git : update SRCREV version
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
X-List-Received-Date: Tue, 12 Sep 2017 02:26:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 01, 2017 at 03:51:03PM -0500, Manisha Agrawal wrote:
> Add new demo pretection-relays-hmi in hmi_apps.

"pretection"


> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 551416d9..1b20f919 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,7 +4,7 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "50a2f2ec7043e17bc7af72186e3d0a8d7773ec0a"
> +SRCREV = "094736065e1a15a49da19ef4c5a100aa763c41d1"
>  BRANCH = "master"
>  INC_PR = "r48"
>  
> -- 
> 2.13.0
> 

