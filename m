Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 833D452A66
	for <meta-arago@arago-project.org>;
	Fri, 13 Jun 2014 20:37:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DKb6Yi020933;
	Fri, 13 Jun 2014 15:37:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DKb68Y013890;
	Fri, 13 Jun 2014 15:37:06 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Jun 2014 15:37:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DKb5d5009304;
	Fri, 13 Jun 2014 15:37:05 -0500
Date: Fri, 13 Jun 2014 16:37:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Tudor Florea <tudor.florea@enea.com>
Message-ID: <20140613203705.GE2311@edge>
References: <1402691617-62798-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
In-Reply-To: <1402691617-62798-1-git-send-email-tudor.florea@enea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/1] Add licenses path for the layer
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
X-List-Received-Date: Fri, 13 Jun 2014 20:37:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=0442fa03bc07bd70376522c290c1af254f7e77d4

-- 
Denys


On Fri, Jun 13, 2014 at 10:33:37PM +0200, Tudor Florea wrote:
> This patch solve the following:
> WARNING: wl18xx-firmware: No generic license file exists for: TI-TSPA in any provider
> Added the TI-TSPA license as it is found in the git repo in
> wl18xx-firmware recipe
> 
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> ---
>  meta-arago-extras/conf/layer.conf         |    1 +
>  meta-arago-extras/custom-licenses/TI-TSPA |   46 +++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-arago-extras/custom-licenses/TI-TSPA
> 
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> index db98224..8e95aaa 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -10,3 +10,4 @@ BBFILE_PRIORITY_meta-arago-extras = "10"
>  
>  # Set a variable to get to the top of the metadata location
>  ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
> +LICENSE_PATH += "${LAYERDIR}/custom-licenses"
> diff --git a/meta-arago-extras/custom-licenses/TI-TSPA b/meta-arago-extras/custom-licenses/TI-TSPA
> new file mode 100644
> index 0000000..b570993
> --- /dev/null
> +++ b/meta-arago-extras/custom-licenses/TI-TSPA
> @@ -0,0 +1,46 @@
> +   1 TECHNOLOGY AND SOFTWARE PUBLICLY AVAILABLE
> +   2 SOFTWARE LICENSE
> +   3 
> +   4 Copyright (c) 2013, Texas Instruments Incorporated.
> +   5 
> +   6 All rights reserved.
> +   7 
> +   8 Redistribution.  
> +   9 
> +  10 Redistribution and use in binary form, without modification, are
> +  11 permitted provided that the following conditions are met:
> +  12 
> +  13  * Redistributions must preserve existing copyright notices and reproduce 
> +  14	this license (including the above copyright notice and the disclaimer below)
> +  15	in the documentation and/or other materials provided with the distribution.
> +  16 
> +  17  * Neither the name of Texas Instruments Incorporated nor the names of 
> +  18    its suppliers may be used to endorse or promote products derived 
> +  19    from this software without specific prior written permission.
> +  20 
> +  21  * No reverse engineering, decompilation, or disassembly of this
> +  22    software is permitted.
> +  23 
> +  24 Limited patent license.
> +  25 
> +  26 Texas Instruments Incorporated grants a world-wide, royalty-free, 
> +  27 non-exclusive license under patents it now or hereafter owns or controls 
> +  28 to make, have made, use, import, offer to sell and sell ("Utilize") this
> +  29 software, but solely to the extent that any such patent is necessary
> +  30 to Utilize the software alone.  The patent license shall not apply to
> +  31 any combinations which include this software.  No hardware per se is
> +  32 licensed hereunder.
> +  33 
> +  34 DISCLAIMER.
> +  35 
> +  36 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +  37 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> +  38 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> +  39 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> +  40 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> +  41 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> +  42 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> +  43 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> +  44 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> +  45 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> +  46 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> -- 
> 1.7.10.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

