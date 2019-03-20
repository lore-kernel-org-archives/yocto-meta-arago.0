Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1DDE9529EF
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2019 17:18:44 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2KHIV4L027287
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2019 12:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553102311;
	bh=LDoc+ve8AAtHLNk6ZR6X8jBV7yvGEmrvPaIP5hniypY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=LXq9qgFaX3goy3z/5etsW+QRHqHvg1U7vf4m/WnUBllPz2h1xwbEm4WzBzG6dHElZ
	pFyfQ6xqh/jumm6i1MY+Z3ZSDr+CjdLZuiDkoOVMX3jEwWCm3RaZGLbdh6zgmmqiQG
	dAchCdLKTYe+AUQh6Br1TYXIkj0yaoXueqXjcR0g=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2KHIVrk037347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2019 12:18:31 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 20 Mar 2019 12:18:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Wed, 20 Mar 2019 12:18:31 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2KHIUgn024795;
	Wed, 20 Mar 2019 12:18:31 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1553101598-12744-1-git-send-email-m-radhakrishnan2@ti.com>
	<1553101598-12744-2-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <38c163e7-915d-15e6-e957-6e1aea8981f1@ti.com>
Date: Wed, 20 Mar 2019 13:18:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <1553101598-12744-2-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master][meta-processor-sdk][PATCH] fftlib: SRCREV bump
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
X-List-Received-Date: Wed, 20 Mar 2019 17:18:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I get an error with this:


"././src/common//fft/fft_dp_mixed_bs.c", line 42: fatal error: cannot 
open source file "ti/dsplib/src/DSPF_dp_fftDPxDP/DSPF_dp_fftDPxDP.h"
1 catastrophic error detected in the compilation of 
"././src/common//fft/fft_dp_mixed_bs.c".
Compilation terminated.


On 3/20/2019 1:06 PM, Mahesh Radhakrishnan wrote:
> This srcrev update deprecates the c64P big endian support
>
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-ti/fftlib/fftlib.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-ti/fftlib/fftlib.inc b/recipes-ti/fftlib/fftlib.inc
> index 87d86cc..7addb90 100644
> --- a/recipes-ti/fftlib/fftlib.inc
> +++ b/recipes-ti/fftlib/fftlib.inc
> @@ -1,5 +1,5 @@
>   PV = "3_1_0_0"
> -INC_PR = "r0"
> +INC_PR = "r1"
>   
>   require recipes-ti/includes/tisdk-paths.inc
>   
> @@ -7,4 +7,4 @@ DESTSUFFIX = "${WORKDIR}/git"
>   
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/fftlib/fftlib.git;protocol=git;name=fftlib;destsuffix=${DESTSUFFIX};branch=${BRANCH}"
> -SRCREV = "1527e517aa43f9ade14b7a4e16e2b6522eb5bbb9"
> +SRCREV = "3d5ebada3cd94096fb798548d68059dc4c34a1ea"

