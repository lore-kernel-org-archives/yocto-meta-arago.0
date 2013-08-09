Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5A9D252A5C
	for <meta-arago@arago-project.org>;
	Fri,  9 Aug 2013 02:08:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7928lOw007038
	for <meta-arago@arago-project.org>; Thu, 8 Aug 2013 21:08:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7928lNR027320
	for <meta-arago@arago-project.org>; Thu, 8 Aug 2013 21:08:47 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 8 Aug 2013 21:08:47 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7928l5J006439;
	Thu, 8 Aug 2013 21:08:47 -0500
Date: Thu, 8 Aug 2013 22:08:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20130809020846.GF25015@edge>
References: <4F9216F96E5DF9428610502835A9F4905493EC54@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905493EC54@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: help needed: Top nightly failure
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
X-List-Received-Date: Fri, 09 Aug 2013 02:08:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Please use a mirror and/or previously cloned repos from downloads/ directory - 
cloning the entire tree every night is not recommended and is rather abusive.

Also, I've repacked the linux-keystone repository so it is now smaller - 
please let me know if you still see the problem.

-- 
Denys


On Fri, Aug 02, 2013 at 06:20:08AM -0400, Nelson, Sam wrote:
>    Hello All
> 
>     
> 
>    We are encountering a lot of nightly failures with fetch failure like the
>    following from the arago-project git.  The error happens randomly and
>    unpredictably.
> 
>    Is this something to do with git servers going down/offline?
> 
>    Any ideas in tracking this type of issue will be appreciated.
> 
>     
> 
>    With regards,
> 
>    Sam
> 
>     
> 
>    ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
> 
>    Cloning into bare repository
>    '/home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-layersetup-mcsdk/downloads/git2/arago-project.org.git.projects.linux-keystone.git'...
> 
>     
> 
>    fatal: The remote end hung up unexpectedly
> 
>    fatal: early EOF
> 
>    fatal: index-pack failed
> 
>     
> 
>    ERROR: Function failed: Fetcher failure for URL:
>    'git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=july-2013b/master'.
>    Unable to fetch URL from any source.
> 
>    ERROR: Logfile of failure stored in:
>    /home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/keystone_evm-oe-linux-gnueabi/linux-keystone-3.8.4-r6a/temp/log.do_fetch.14929
> 
>     

