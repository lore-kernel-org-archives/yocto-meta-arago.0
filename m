Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5956C52A0E
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2019 19:22:54 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62JM864109534
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 14:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562095328;
	bh=cLYsnL6KAr9bmYVevO1IwxaRboVIT6+oM2/YWHY2oQM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Kk0NJ4s5y9Ej23s5Ax82mNOdArzQojLA6NslmyFmHnVynzJMr4YE2l8Xv97SPIGsC
	2dURzIFW1l7HaFeUiOtvZOkC3JHWMv/YEBxO0N34PlelCVKyXLSdAmb5ubDRsjKJE4
	SSaqRpXe/zoz70csujYlcM6AKIKbBHtUM14O6VCo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62JM85f111855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 14:22:08 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 14:22:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 14:22:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62JM84X093347;
	Tue, 2 Jul 2019 14:22:08 -0500
Date: Tue, 2 Jul 2019 15:22:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Subhajit Paul <subhajit_paul@ti.com>
Message-ID: <20190702192208.GY21181@beryl>
References: <1562089211-27689-1-git-send-email-subhajit_paul@ti.com>
MIME-Version: 1.0
In-Reply-To: <1562089211-27689-1-git-send-email-subhajit_paul@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-test: add display-sharing firmware
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
X-List-Received-Date: Tue, 02 Jul 2019 19:22:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 02, 2019 at 11:10:11PM +0530, Subhajit Paul wrote:
> Signed-off-by: Subhajit Paul <subhajit_paul@ti.com>
> ---
>  meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> index 67de045..0b4dcfa 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> @@ -68,6 +68,7 @@ ARAGO_TI_TEST_append_am65xx = " \
>  
>  ARAGO_TI_TEST_append_j7-evm = " \
>      viddec-test-app \
> +    ti-display-sharing-firmware \

The firmware is not specific to testing, so this is not the correct 
packagegroup.

One option is to add it to RDEPENDS for the kernel:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/recipes-kernel/linux/linux-ti-staging_4.19.bb?h=thud&id=4c130089c5db0a3da9811e2ec768fcba48eba6bb


>      "
>  
>  ARAGO_TI_TEST_append_keystone = " \
> -- 
> 2.7.4
> 

