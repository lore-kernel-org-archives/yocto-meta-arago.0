Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EB09552993
	for <meta-arago@arago-project.org>;
	Mon, 23 Jul 2018 21:55:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6NLtG6D021681
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 16:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532382917;
	bh=DjP66o8x15W+yv+lMcVhwWWXuBocslvc8Ru0AguhlZI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=YaC/I9LRQmqCjC9XKX3+255VxGgF4NXtpteSUsL0l7Bpk43rqoox/HgXiYixIJVmf
	tBQ8k+vVF0eZqRQsEvuC9BQBfiGkXNymJ+N//h66SeBghnQ8zwKAGeoFvrFNv2M+8k
	krG31vBcZyi6QCHYbxSjBI5z+TDJLASSz9U6yyLY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NLtGY6003766
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 16:55:16 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 23 Jul 2018 16:55:16 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 23 Jul 2018 16:55:15 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NLtFHN001720;
	Mon, 23 Jul 2018 16:55:16 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1532375688-4054-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ddae260d-2185-f8a6-0609-b8df1ed38914@ti.com>
Date: Mon, 23 Jul 2018 17:55:15 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <1532375688-4054-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [rocko/master][PATCHv2] tidl-utils: SRCREV bump
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
X-List-Received-Date: Mon, 23 Jul 2018 21:55:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please apply this to the ti2018.01 branch?


Thank you,

Jake


On 7/23/2018 3:54 PM, Djordje Senicic wrote:
> * Get new version of tidl-utils configuration files with fixed path
> * RDEPENDS is not needed for x86 target, as executables are statically linked
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> index 264b030..569de5a 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> @@ -8,10 +8,10 @@ INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
>   
> -RDEPENDS_${PN} += " tidl-api tidl-examples "
> +RDEPENDS_${PN}_class-target += " tidl-api tidl-examples "
>   
>   SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> -SRCREV = "93f66d2c53960b13b7e7f20208ee205f727aaf28"
> +SRCREV = "994d90ae583610673d9d39086ca5e84027a9c56e"
>   
>   PR = "${INC_PR}.0"
>   


