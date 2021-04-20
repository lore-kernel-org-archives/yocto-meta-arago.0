Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 46CBC52B2B
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 03:17:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13K3IGpN063789;
	Mon, 19 Apr 2021 22:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618888696;
	bh=HVFjveGQ/End25za/t0mbKq2NynFS6+3GoNbJexyTl8=;
	h=Subject:CC:References:To:From:Date:In-Reply-To;
	b=dlsB8XLHKYuY1gkr/Uy0w7LP8Ba5U9puPOskvd5+f0OttybGzCjx6GuHE+KUUfWCD
	mFSrknkdEXYIleYcQ1x+svJlwksahXq7pwQJqHCGkltEkQwsy9OQDjCszE1GuxryE7
	5jgRRkYcunJ+hbXl9+dEfzbomwqIhnS8nMScJFl0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13K3IF52065742
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 22:18:16 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 19 Apr 2021 22:18:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 19 Apr 2021 22:18:15 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13K3IFVe007261;
	Mon, 19 Apr 2021 22:18:15 -0500
References: <20210420030549.16897-1-praneeth@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <6fe4e9be-2ff0-a714-90b0-948987a8ac4f@ti.com>
Date: Mon, 19 Apr 2021 22:18:15 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210420030549.16897-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master PATCH] ti-test: omap-a15: split package selection command to avoid build erros
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
X-List-Received-Date: Tue, 20 Apr 2021 03:17:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/19/2021 10:05 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Split the package selection option for omap-a15 based machines to avoid
> the build errors like this.
> 
> ERROR: Nothing RPROVIDES '${@oe.utils.conditional('ARAGO_BRAND','
> (but <>/packagegroups/ti-test.bb RDEPENDS on or otherwise requires it)
> 
> NOTE: Runtime target '${@oe.utils.conditional('ARAGO_BRAND',' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ["${@oe.utils.conditional('ARAGO_BRAND',"]

Please ignore this one as its not the right fix.


> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   .../recipes-core/packagegroups/ti-test.bb             | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> index cbc246d5..2730c381 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> @@ -66,14 +66,9 @@ ARAGO_TI_TEST_append_ti43x = " \
>       ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'cmem-test', d)} \
>   "
>   
> -ARAGO_TI_TEST_append_omap-a15 = " \
> -    omapconf \
> -    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
> -        ti-ipc-test \
> -        ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
> -        cmem-test \
> -    ", d)} \
> -"
> +ARAGO_TI_TEST_append_omap-a15 = "omapconf ti-ipc-test cmem-test"
> +
> +ARAGO_TI_TEST_append_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
>   
>   ARAGO_TI_TEST_append_k3 = " \
>       k3conf \
> 

