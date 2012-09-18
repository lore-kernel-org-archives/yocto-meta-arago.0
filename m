Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id C7BFA52A69
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2012 18:37:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAK00JWG6E2PAN0@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 18 Sep 2012 13:37:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E975C20369; Tue,
	18 Sep 2012 14:37:13 -0400 (EDT)
Date: Tue, 18 Sep 2012 14:37:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20120918183713.GB11454@denix.org>
References: <1347043857-20831-1-git-send-email-fcooper27jr@gmail.com>
	<1347043857-20831-2-git-send-email-fcooper27jr@gmail.com>
MIME-version: 1.0
In-reply-to: <1347043857-20831-2-git-send-email-fcooper27jr@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org,
	"Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: Re: [meta-arago-distro][PATCH 2/2] flash-utility: Add temporary license file
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
X-List-Received-Date: Tue, 18 Sep 2012 18:37:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Sep 07, 2012 at 01:50:57PM -0500, Franklin S. Cooper Jr wrote:
> * Add temporary license file to the flash-utility.
> * This file was grabbed from the license agreement screen when
>   installing the flash utility.
> * A proper license file needs to be added to the zip file that is apart
>   of the official flash utility release.

Oops, this is something I wanted to comment on before, but forgot:

While only LICENSE is required to be set in the recipe during parsing time and 
not the LIC_FILES_CHKSUM, the latter is still required to be present for the 
recipe to build. So, by adding those in 2 steps/patches technically breaks 
bisectability. One of the requirements for a good patch is to be atomically 
complete as individual entity...

-- 
Denys


> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> ---
>  .../flash-utility/flash-utility-1.6.0.0/LICENSE    |   63 ++++++++++++++++++++
>  .../flash-utility/flash-utility_1.6.0.0.bb         |   14 ++++-
>  2 files changed, 76 insertions(+), 1 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-arago/flash-utility/flash-utility-1.6.0.0/LICENSE
> 
> diff --git a/meta-arago-distro/recipes-arago/flash-utility/flash-utility-1.6.0.0/LICENSE b/meta-arago-distro/recipes-arago/flash-utility/flash-utility-1.6.0.0/LICENSE
> new file mode 100644
> index 0000000..dc4f3dd
> --- /dev/null
> +++ b/meta-arago-distro/recipes-arago/flash-utility/flash-utility-1.6.0.0/LICENSE
> @@ -0,0 +1,63 @@
> +Copyright (c) 2010, Texas Instruments Incorporated
> +All rights reserved.
> +
> +Redistribution and use in source and binary forms, with or without modification, 
> +are permitted provided that the following conditions are met:
> +
> + - Redistributions of source code must retain the above copyright notice, 
> +   this list of conditions and the following disclaimer.
> + - Redistributions in binary form must reproduce the above copyright notice, 
> +   this list of conditions and the following disclaimer in the documentation 
> +   and/or other materials provided with the distribution.
> + - Neither the name of Texas Instruments nor the names of its contributors 
> +   may be used to endorse or promote products derived from this software  
> +   without specific prior written permission.
> +
> + THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> + "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> + LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> + FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> + COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> + INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
> + BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
> + OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
> + AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> + OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> + OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> + SUCH DAMAGE.
> +
> +Copyright (C) 2008 The Android Open Source Project
> +All rights reserved.
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions
> +are met:
> +
> + - Redistributions of source code must retain the above copyright
> +   notice, this list of conditions and the following disclaimer.
> + - Redistributions in binary form must reproduce the above copyright
> +   notice, this list of conditions and the following disclaimer in
> +   the documentation and/or other materials provided with the 
> +   distribution.
> + 
> + THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> + "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> + LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> + FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> + COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> + INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
> + BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
> + OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
> + AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> + OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> + OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> + SUCH DAMAGE.
> + 
> +Copyright (c) 1996 L. Peter Deutsch and Jean-Loup Gailly
> +
> +Permission is granted to copy and distribute this document for any
> +purpose and without charge, including translations into other
> +languages and incorporation into compilations, provided that the
> +copyright notice and this notice are preserved, and that any
> +substantive changes or deletions from the original are clearly
> +marked.
> \ No newline at end of file
> diff --git a/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb b/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb
> index 94d78f6..e25557e 100644
> --- a/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb
> +++ b/meta-arago-distro/recipes-arago/flash-utility/flash-utility_1.6.0.0.bb
> @@ -1,15 +1,27 @@
>  DESCRIPTION = "Texas Instruments Flash Utility"
>  LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3fff2f9c28a0f21bdb38a7a718701562"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  COMPATIBLE_MACHINE = "am37x-evm|am3517-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/580/4785/Flash_v1.6.0.0.zip;name=base;subdir=${P}"
> +
> +# Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
> +# from the License Agreement screen when installing the flash utility application.
> +SRC_URI += "file://LICENSE"
> +
>  S = "${WORKDIR}/${P}"
>  
> +do_unpack_extra() {
> +    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}
> +}
> +
> +addtask unpack_extra after do_unpack before do_patch
> +
>  installdir = "host-tools/flash_utils/windows"
>  
>  do_install() {
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

