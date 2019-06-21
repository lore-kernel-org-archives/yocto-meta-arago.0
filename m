Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AFE0052980
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 13:00:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LD07eP019982
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561122007;
	bh=uB3mFSdh5p16kNDkW6Up7yqW5dJ6dqfVjp36e6lNR5g=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ZmMnd/kkKWUt3u/8SyCaU7X2VdOlJ7DFHtf3CX8rnPjTtSsyp7USUG8v4WjTMKcL8
	wrqZOm9E1nhnaueFts+ielrFAuFV3MVF32dV4wUzBXRwzCQb6MA2o2f2tPe92lBPXJ
	nOU/Nrr3cKwxg2+ePcJ5LrcIjA31pbpV9WeCQtKY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LD07G7015190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:00:07 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 08:00:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 08:00:07 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LD06rx013241;
	Fri, 21 Jun 2019 08:00:07 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <20190619131314.12011-1-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <462fdb0a-973c-fb72-a5aa-8ff11579fdca@ti.com>
Date: Fri, 21 Jun 2019 09:00:06 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619131314.12011-1-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/ti2019.01][PATCH] matrix-gui-apps-git:bump SRCREV to run video analytic demo over Weston
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
X-List-Received-Date: Fri, 21 Jun 2019 13:00:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake


On 6/19/2019 9:13 AM, Eric Ruei wrote:
> Restore the video analytic demo to be run on top of Weston instead of
> qt-compositor because the display problem has been fixed at Weston 5.0
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 487f1544..f4c095ed 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>   LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>   
>   SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "2b41ee1f8e0dfe6b5f78d56e13a51aab115aaff0"
> +SRCREV = "c621180046554c0a24998fea165f3abadc75c25e"
>   BRANCH = "master"
> -INC_PR = "r70"
> +INC_PR = "r71"
>   
>   # Pull in the base package for installing matrix applications
>   require matrix-gui-apps.inc

