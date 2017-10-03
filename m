Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 4CD49529A4
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 17:29:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93HTwLg029744
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 12:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507051798;
	bh=RFJdHUnR+raDFVupcX9QCmPEi9//8uVJOltZPua+rpE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=HTBfKgmFcJYOb1NJ0pGvYk574HfN2Hm6dLFDtB53SWQRj+M4BOSOM+TzILBxDWyRF
	xcRH/krRbsJkzf1vPtZID6hXzQZC2XO9n95aPJku/Pp46ddabwNml8b4H0mTjH5XG9
	xEB6WPtZ/bvSznBaFNCQkv0N1HQoRNOcvpnkIVAI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93HTwDO002545
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 12:29:58 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 12:29:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 12:29:58 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93HTvHC030777;
	Tue, 3 Oct 2017 12:29:57 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
	<1507046051-57949-16-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <9032737c-10cb-cdb5-51eb-f56c9b1471df@ti.com>
Date: Tue, 3 Oct 2017 13:29:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507046051-57949-16-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH v2 15/23] packagegroup-arago-test-addons: remove omapdrmtest for X11(xsgx) build
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
X-List-Received-Date: Tue, 03 Oct 2017 17:29:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Eric,


This patch fails to apply. Can you please rebase your patches on the 
latest of the master branch?


Thanks,

Jake


On 10/3/2017 11:54 AM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
> index e477295..19a627c 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = ".tisdk6"
> +PR_append = ".tisdk7"
>   
>   TEST_ADDONS_TI_append_keystone = " \
>       mmap-lld-test \
> @@ -29,3 +29,7 @@ TEST_ADDONS_TI_append_ti43x  = " \
>   
>   TEST_ADDONS_TI_append_am335x-evm  = " icss-emac-lld-test"
>   TEST_ADDONS_TI_append_am437x-evm  = " icss-emac-lld-test"
> +
> +TEST_ADDONS_TI_remove_omap-a15 = " \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'omapdrmtest', '', d)} \
> +    "


