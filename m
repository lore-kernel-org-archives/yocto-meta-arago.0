Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 18AAB52A27
	for <meta-arago@arago-project.org>;
	Mon,  4 Dec 2017 19:55:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB4JtYrZ031895
	for <meta-arago@arago-project.org>; Mon, 4 Dec 2017 13:55:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512417334;
	bh=J5kpFUpZXWDylRR6XyyHobq66cCXA1t/OjS/+pv6wGQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MsJnENBoEcQI8+9roXBU+P+qmtZzPn6U7nxdgXsx+0+9Ibz8lE/WUhiOx4uwncZ7k
	3NDm0PRZ7M1GDFXgzq13zYltCLRA5evGdNenJ6tiYKhgR90xyhFYxQ6ijo6/NNlNvB
	hcG8C9ZizKopdVNXHW9x8ekyDebumeNpgoSOBFG8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4JtTb0009733
	for <meta-arago@arago-project.org>; Mon, 4 Dec 2017 13:55:29 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 4 Dec 2017 13:55:29 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 4 Dec 2017 13:55:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4JtTiY002645;
	Mon, 4 Dec 2017 13:55:29 -0600
Date: Mon, 4 Dec 2017 14:55:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>
Message-ID: <20171204195513.GE15340@edge>
References: <8665E2433BC68541A24DFFCA87B70F5B364A85F9@DFRE01.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8665E2433BC68541A24DFFCA87B70F5B364A85F9@DFRE01.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] hostap-daemon-wl18xx: update recipe for version R8.7_SP3
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
X-List-Received-Date: Mon, 04 Dec 2017 19:55:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Dec 03, 2017 at 05:39:06AM -0500, Reizer, Eyal wrote:
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  .../recipes-connectivity/hostap/hostap-daemon-wl18xx.bb      | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
> index 1151012..0288a54 100644
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
> @@ -4,19 +4,19 @@
>  require hostap.inc
>  
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://../COPYING;md5=36b27801447e0662ee0138d17fe93880"
> +LIC_FILES_CHKSUM = "file://../COPYING;md5=292eece3f2ebbaa25608eed8464018a3"

Same request for license checksum change.


> -PR_append = "d"
> +PR_append = "e"
>  
>  FILESEXTRAPATHS_append := ":${THISDIR}/hostap-daemon"
>  
>  # Add TI to the end to make it clear that this is a TI customized version
>  # of hostap
> -PV = "R8.6-devel-ti+git${SRCPV}"
> +PV = "R8.7_SP3-devel-ti+git${SRCPV}"
>  
> -# Tag: R8.6
> -SRCREV = "f80fe345acf103ba6882ac8396f19584ac184904"
> -BRANCH = "upstream_24"
> +# Tag: R8.7_SP3
> +SRCREV = "ee8fbdb840d95e048f58fb62bf3b5472041b5417"
> +BRANCH = "upstream_25_rebase"
>  
>  PROVIDES += "hostap-daemon"
>  RPROVIDES_${PN} += "hostap-daemon"
> -- 
> 2.7.4
> 

