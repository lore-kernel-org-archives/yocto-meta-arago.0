Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 2991A52AC0
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 17:32:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7THWHH1015715
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504027937;
	bh=C09GNzmdyZDL8HqJcOfKuczsHPeDC7dMRM0+LBpzk5A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jIcfz5cY15jo8cR50Y1MfkRLgDT/r99JsNyB7LdtwRDGf0l8KHWKq/BeH07iFAkcl
	7WrSMa6GhpoHMHHviCZgWvBfir8/rBRlhJkDrikCq52z3VFpqGjs/sRRze6X5F2i2B
	uNKr1X0WzfPPwkJS6DeHhdmM92EnqpmsD2Qgl/8o=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THWH6u024605
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:32:17 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 12:32:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 12:32:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THWGLA001429;
	Tue, 29 Aug 2017 12:32:16 -0500
Date: Tue, 29 Aug 2017 13:32:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20170829173212.GI8304@edge>
References: <20170829163826.15777-1-manisha.agrawal@ti.com>
	<20170829163826.15777-5-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170829163826.15777-5-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v2 5/6] meta-arago-distro: conf : arago-source-ipk.inc
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
X-List-Received-Date: Tue, 29 Aug 2017 17:32:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Same comment about the subject.

Basically, the commit log in over-simplified form looks like:

=================
where: what changed

why the change is needed

sign-offs:
=================


On Tue, Aug 29, 2017 at 11:38:25AM -0500, Manisha Agrawal wrote:
>  Add the source code for evse-hmi demo in example-applications of PLSDK.
> 
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> index c598d5d..5dd1ca6 100644
> --- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> @@ -67,6 +67,9 @@ SRCIPK_INSTALL_DIR_pn-qt-tstat = "example-applications/${PN}-${PV}"
>  CREATE_SRCIPK_pn-dual-camera-demo = "1"
>  SRCIPK_INSTALL_DIR_pn-dual-camera-demo = "example-applications/${PN}-${PV}"
>  
> +CREATE_SRCIPK_pn-evse-hmi = "1"
> +SRCIPK_INSTALL_DIR_pn-evse-hmi = "example-applications/${PN}-${PV}"
> +
>  CREATE_SRCIPK_pn-image-gallery = "1"
>  SRCIPK_INSTALL_DIR_pn-image-gallery = "example-applications/${PN}"
>  
> -- 
> 2.13.0
> 

