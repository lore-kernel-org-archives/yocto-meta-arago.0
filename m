Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 49B8A520E2
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2019 17:07:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PH61Kc047057
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 12:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569431161;
	bh=rvHfG+6NuiQynPLHyytzxoMkS5jQHjy/o6SwzKkP/7o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=tWSWj11GHf76KnLsfMUVK8tlzHbgAcMBsc5XuSl1KW7quEqO5yD5T2165QK07xXAN
	j5YlH+LEv7//lFKuaK1aoxckxfc4BZ/ujYkeMIWRbvLw36kP0hOC51/HUEGyx5wyUK
	pW74DZN/wSlcY1k2zwqHRuDL6nBNSCobqOSZVjwI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8PH61YL085545
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 12:06:01 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 25 Sep 2019 12:05:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 25 Sep 2019 12:06:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PH614l079337;
	Wed, 25 Sep 2019 12:06:01 -0500
Date: Wed, 25 Sep 2019 13:06:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20190925170600.GC4163@beryl>
References: <1569428332-25738-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1569428332-25738-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master PATCH v1] recipes-bsp: ti-sci-fw: Enable traces for j7-evm
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
X-List-Received-Date: Wed, 25 Sep 2019 17:07:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Why only J7? Do we want it enabled on AM65x as well?


On Wed, Sep 25, 2019 at 09:48:52PM +0530, Nikhil Devshatwar wrote:
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
> index fab4de4..e7cf1a8 100644
> --- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
> +++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
> @@ -72,6 +72,9 @@ EXTRA_OEMAKE_append_am65xx-hs-evm = " \
>      HS=1 SYSFW_HS_PATH="${WORKDIR}/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${WORKDIR}/${SYSFW_BASE}-cert.bin" \
>  "
>  
> +EXTRA_OEMAKE_append_j7-evm = " \
> +    ENABLE_TRACE=1 \
> +"
>  do_compile() {
>  	cd ${WORKDIR}/imggen/
>  	oe_runmake
> -- 
> 1.9.1
> 

