Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 45117529AD
	for <meta-arago@arago-project.org>;
	Wed, 16 Mar 2016 18:21:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2GIL0Q1012825
	for <meta-arago@arago-project.org>; Wed, 16 Mar 2016 13:21:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GIL0pb010421
	for <meta-arago@arago-project.org>; Wed, 16 Mar 2016 13:21:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Mar 2016 13:21:00 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GIL02N025857;
	Wed, 16 Mar 2016 13:21:00 -0500
Message-ID: <56E9A40C.6080704@ti.com>
Date: Wed, 16 Mar 2016 14:21:00 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
Cc: xuj@ti.com
Subject: Re: [PATCH 0/8] Add LibArch and LinAlg
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
X-List-Received-Date: Wed, 16 Mar 2016 18:21:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

What are the chances of this making it into the 2015.03 release?

Thank you,
Jake

On 3/15/2016 3:54 PM, Jacob Stiffler wrote:
> Integrate Library Architecture and Framework (LibArch)
> and TI Linear Algebra Library (LinAlg)
>
> Jacob Stiffler (8):
>    libarch: Add version 1.0.0.0
>    libarch-examples: Add examples for libarch version 1.0.0.0
>    arago-source-ipk: Enable libarch-examples-src
>    linalg: Add Linear Algebra Library version 1.2.0.0
>    linalg-examples: And Linear Algebra Library examples
>    arago-source-ipk: Enable linalg-examples-src
>    packagegroup-arago-tisdk-addons: k2hk-evm: Integrate linalg
>    ti-tisdk-makefile: Add linalg-examples target
>
>   .../conf/distro/arago-source-ipk.conf              |  7 ++
>   .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  3 +-
>   .../packagegroup-arago-tisdk-addons-sdk-target.bb  |  3 +-
>   .../packagegroup-arago-tisdk-addons.bb             |  3 +-
>   .../ti-tisdk-makefile/Makefile_linalg-examples     | 39 ++++++++++++
>   .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 +-
>   .../recipes-ti/includes/arago-paths.inc            |  7 ++
>   .../recipes-ti/libarch/libarch-examples_git.bb     | 36 +++++++++++
>   meta-arago-extras/recipes-ti/libarch/libarch.inc   | 32 ++++++++++
>   .../recipes-ti/libarch/libarch_git.bb              | 25 ++++++++
>   .../recipes-ti/linalg/linalg-examples_git.bb       | 74 ++++++++++++++++++++++
>   meta-arago-extras/recipes-ti/linalg/linalg.inc     | 43 +++++++++++++
>   meta-arago-extras/recipes-ti/linalg/linalg_git.bb  | 23 +++++++
>   13 files changed, 295 insertions(+), 4 deletions(-)
>   create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples
>   create mode 100644 meta-arago-extras/recipes-ti/includes/arago-paths.inc
>   create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
>   create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch.inc
>   create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch_git.bb
>   create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
>   create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg.inc
>   create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg_git.bb
>


