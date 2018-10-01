Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 59E5852079
	for <meta-arago@arago-project.org>;
	Mon,  1 Oct 2018 12:27:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w91CR6uc010013
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 07:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538396826;
	bh=U/1taqQR8izRuvSGIRwyuZx5CXgxLDUw/VVU/bE1wVE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=iCcFsdJENO/YunKOGrev7pQed3q9N5jt254rI970k9AVRiHFSqe6VEanv+KcAJaYr
	QaAAeqCqaDaf7iTcoLjgaErDPBCx9u5mz9iHF+wOromiCL0EYQcqgQAX8Bhmx9Wkp0
	f+hdK4eTQpSL0Kwnn2vPiUQZIwRHN9B3+fXZE8nM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w91CR5xP020392
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 07:27:06 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 1 Oct 2018 07:27:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 1 Oct 2018 07:27:05 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w91CR5EZ017711;
	Mon, 1 Oct 2018 07:27:05 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1538153546-1341-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <269a6aaf-fde4-1535-73b3-9875570dce96@ti.com>
Date: Mon, 1 Oct 2018 08:27:06 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1538153546-1341-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master/ti2018.03] [PATCH] matrix-gui-apps-git.inc: bump SRCREV to get script changes for tidl demos
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
X-List-Received-Date: Mon, 01 Oct 2018 12:27:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,


Can you please backport this to the ti2018.03 branch?


Thank you,

Jake


On 9/28/2018 12:52 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index c407088..1443d53 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>   LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>   
>   SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "f9eabc0cc02330351b1cbe049ba0b7d049cc26c1"
> +SRCREV = "d376d6287c749eec8846105d9aa4b8d4c7437dc8"
>   BRANCH = "master"
> -INC_PR = "r60"
> +INC_PR = "r61"
>   
>   # Pull in the base package for installing matrix applications
>   require matrix-gui-apps.inc

