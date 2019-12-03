Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4334E52995
	for <meta-arago@arago-project.org>;
	Tue,  3 Dec 2019 01:23:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB31M7HU071354
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2019 19:22:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575336127;
	bh=FhUbxJgQLgut4bBxbEMIXp+cABaGMoVHe36NVSlTgSE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SoM+83qNrwJmT7eq33HqqbX35yNfIiHn85KzvFm+ejT700zbfkW7uJa8iqZDRiSfV
	jgp0uUffuJ7lax0/pmDUtSPVPaCkf6w3ezuQ9rX2S/KMVPUhFPn8BQQbicHK5J5TDX
	Ng4Jw3sW9tHy2Zs+UjjbOa6vHxEJV18t09ZmJdvY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB31M7Ym023459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2019 19:22:07 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 2 Dec 2019 19:22:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 2 Dec 2019 19:22:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB31M6sK075690;
	Mon, 2 Dec 2019 19:22:06 -0600
Date: Mon, 2 Dec 2019 20:22:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20191203012206.GE24609@beryl>
References: <1574248423-156560-1-git-send-email-nikhil.nd@ti.com>
	<20191121181655.GD27719@beryl>
MIME-Version: 1.0
In-Reply-To: <20191121181655.GD27719@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, grygorii.strashko@ti.com, nsekhar@ti.com
Subject: Re: [thud/master] [PATCH] branding: core: Autoload rpmsg_kdrv_switch for j7-evm
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
X-List-Received-Date: Tue, 03 Dec 2019 01:23:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Pong.


On Thu, Nov 21, 2019 at 01:16:55PM -0500, Denys Dmytriyenko wrote:
> Nikhil,
> 
> This is the wrong place to do it. If rpmsg_kdrv_switch is in-tree module, then 
> simply add this to the kernel recipe:
> 
> KERNEL_MODULE_AUTOLOAD_append_j7-evm = " rpmsg_kdrv_switch"
> 
> -- 
> Denys
> 
> 
> On Wed, Nov 20, 2019 at 04:43:43PM +0530, Nikhil Devshatwar wrote:
> > rpmsg_kdrv_switch kernel module is needed for the cpsw9g virtual net
> > driver. Since there is no symbol dependency, rpmsg_kdrv_switch
> > does not get loaded automatically.
> > 
> > Add branding file override for j7-evm to autoload this module.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> > Fixes: LCPD-17113
> > 
> >  meta-arago-distro/conf/distro/include/branding-core.inc | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
> > index cab9831..c70f8d1 100644
> > --- a/meta-arago-distro/conf/distro/include/branding-core.inc
> > +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
> > @@ -11,3 +11,8 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
> >  
> >  # Raise priority for sample IPC FW images
> >  ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
> > +
> > +# Autoload the kernel module
> > +KERNEL_MODULE_AUTOLOAD_EXTRAS = ""
> > +KERNEL_MODULE_AUTOLOAD_EXTRAS_j7-evm += "rpmsg_kdrv_switch"
> > +KERNEL_MODULE_AUTOLOAD += "${KERNEL_MODULE_AUTOLOAD_EXTRAS}"
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

