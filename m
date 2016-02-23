Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AF04552993
	for <meta-arago@arago-project.org>;
	Tue, 23 Feb 2016 21:41:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1NLfAwD001158
	for <meta-arago@arago-project.org>; Tue, 23 Feb 2016 15:41:10 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1NLfAji026333
	for <meta-arago@arago-project.org>; Tue, 23 Feb 2016 15:41:10 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Feb 2016 15:41:10 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1NLf9EQ021654	for
	<meta-arago@arago-project.org>; Tue, 23 Feb 2016 15:41:10 -0600
Message-ID: <56CCD1F5.2080909@ti.com>
Date: Tue, 23 Feb 2016 16:41:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
Subject: Re: [PATCH 0/7] Integrate OpenMP Accelerator Model
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
X-List-Received-Date: Tue, 23 Feb 2016 21:41:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping,

On 2/19/2016 2:42 PM, Jacob Stiffler wrote:
> Jacob Stiffler (7):
>    openmpacc: Add clacc, the OpenMP-Acc compiler
>    openmpacc: Add OpenMP-Acc library
>    openmpacc-examples: Add the OpenMP-Acc examples
>    arago-source-ipk: Enable openmpacc-examples source ipk
>    packagegroup-arago-tisdk-addons*: Integrate openmpacc into the SDK
>    nativesdk-packagegroup-arago-sdk-host: Add clacc to the devkit
>    ti-tisdk-makefile: Add openmpacc-examples target
>
>   .../conf/distro/arago-source-ipk.conf              |  3 +
>   .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  6 +-
>   .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 15 +++--
>   .../packagegroup-arago-tisdk-addons.bb             |  6 +-
>   .../ti-tisdk-makefile/Makefile_openmpacc-examples  | 32 ++++++++++
>   .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  7 ++-
>   .../nativesdk-packagegroup-arago-sdk-host.bb       |  3 +-
>   .../recipes-ti/openmpacc/clacc_git.bb              | 38 ++++++++++++
>   .../recipes-ti/openmpacc/openmpacc-examples_git.bb | 72 ++++++++++++++++++++++
>   .../recipes-ti/openmpacc/openmpacc.inc             | 21 +++++++
>   .../recipes-ti/openmpacc/openmpacc_git.bb          | 19 ++++++
>   11 files changed, 214 insertions(+), 8 deletions(-)
>   create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples
>   create mode 100644 meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
>   create mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
>   create mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
>   create mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
>


