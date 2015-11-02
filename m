Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0A2B352A0A
	for <meta-arago@arago-project.org>;
	Mon,  2 Nov 2015 17:40:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA2HekqI003319
	for <meta-arago@arago-project.org>; Mon, 2 Nov 2015 11:40:46 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA2Hek05017697
	for <meta-arago@arago-project.org>; Mon, 2 Nov 2015 11:40:46 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 Nov 2015 11:40:46 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA2Hej4n030575	for
	<meta-arago@arago-project.org>; Mon, 2 Nov 2015 11:40:46 -0600
Message-ID: <5637A01D.2070105@ti.com>
Date: Mon, 2 Nov 2015 12:40:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
Subject: Re: [PATCH 0/8] Integrate OpenCL
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
X-List-Received-Date: Mon, 02 Nov 2015 17:40:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping.

On 10/27/2015 3:05 PM, Jacob Stiffler wrote:
> * Integrate the OpenCL packages into the target filesystem and devkit
> * Integrate the OpenCL Example matrix files
> * Enable rebuilding the OpenCL example sources from the SDK
>
> Jacob Stiffler (8):
>    packagegroup-arago-tisdk-addons: Clean up machine-specific packages
>    packagegroup-arago-tisdk-addons: Add opencl dev pkgs and examples
>    packagegroup-arago-tisdk-addons-sdk-target: Add opencl to devkit
>    packagegroup-arago-tisdk-addons-sdk-host: Add opencl example sources
>    packagegroup-arago-tisdk-matrix: Add opencl matrix demos
>    nativesdk-packagegroup-arago-sdk-host: Add clocl
>    ti-tisdk-makefile: Include opencl-example fragment for dra7xx
>    arago-base-tisdk-image: Add BAD_RECOMMENDATIONS to remove unneeded dev
>      pkgs
>
>   .../recipes-core/images/arago-base-tisdk-image.bb  |  7 ++++
>   .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  6 +++-
>   .../packagegroup-arago-tisdk-addons-sdk-target.bb  |  6 ++--
>   .../packagegroup-arago-tisdk-addons.bb             | 38 ++++++++++++++--------
>   .../packagegroup-arago-tisdk-matrix.bb             |  7 +++-
>   .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  3 +-
>   .../nativesdk-packagegroup-arago-sdk-host.bb       |  4 +--
>   7 files changed, 51 insertions(+), 20 deletions(-)
>


