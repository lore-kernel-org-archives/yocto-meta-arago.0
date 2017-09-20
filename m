Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1F11D52A3E
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 18:07:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KI7PSC012283
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505930845;
	bh=2oDkTL7h+RXE4jUKe60EzXd6x3loplPC1k7Na8/pEOQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=QtvX72zrH4c+PZHG0qHAWRC40J2paIsg18eb0OvE5oe0uDivMv9ACYBHYG1EQCRDR
	htM+UnGhc4NfGX6oEuFMzIS5/i4TKzRolRFD+6NERX2RbZ3dAZmtR6ErNCLNilVK6P
	IkhXC08ByM/ypHWuvmj3JhURAfWjvPShZAfX+pJ8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI7KtE029164
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:07:20 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 13:07:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 13:07:19 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI7Jjx002371;
	Wed, 20 Sep 2017 13:07:19 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1505921862-28770-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <3300e38f-32f9-3184-8450-6bee2b1270b0@ti.com>
Date: Wed, 20 Sep 2017 14:07:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505921862-28770-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] packagegroup-arago-tisdk-addons: add uio-test-pruss for k2g
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
X-List-Received-Date: Wed, 20 Sep 2017 18:07:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed.


On 9/20/2017 11:37 AM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> index 81d9b2f..191f185 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> @@ -1,4 +1,4 @@
> -PR_append = "-tisdk38"
> +PR_append = "-tisdk39"
>   
>   EXTRA_PACKAGES_append_ti33x = " opencv"
>   EXTRA_PACKAGES_append_ti43x = " opencv"
> @@ -29,6 +29,8 @@ UTILS_append_ti33x = " uio-module-drv-test \
>                          uio-test-pruss \
>   "
>   
> +UTILS_append_k2g = " uio-test-pruss"
> +
>   EXTRA_PACKAGES_append_omap-a15 = " big-data-ipc-demo-linux \
>                                      big-data-ipc-demo-linux-firmware \
>   "


