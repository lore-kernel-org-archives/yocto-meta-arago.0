Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DD5EF529DE
	for <meta-arago@arago-project.org>;
	Mon, 12 Aug 2013 22:31:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7CMVKfe014051
	for <meta-arago@arago-project.org>; Mon, 12 Aug 2013 17:31:20 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7CMVKVt019151;
	Mon, 12 Aug 2013 17:31:20 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 12 Aug 2013 17:31:20 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7CMVKD8008698;
	Mon, 12 Aug 2013 17:31:20 -0500
Date: Mon, 12 Aug 2013 18:31:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20130812223119.GB30860@edge>
References: <4F9216F96E5DF9428610502835A9F4905493EC54@DLEE11.ent.ti.com>
	<20130809020846.GF25015@edge>
	<4F9216F96E5DF9428610502835A9F4905494E746@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905494E746@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"ares-team@list.ti.com - Raj
	Sivarajan's Team \(May contain non-TIers\)" <ares-team@list.ti.com>
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
X-List-Received-Date: Mon, 12 Aug 2013 22:31:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

I have already mentioned many times that you should use a mirror...

I don't see any problems with the server and I'm cloning your trees right now 
w/o problems so far. You may want to check your proxy setup as well.

BTW, did repacking the linux-keystone help for your nightlies? I can do the 
same for linux-tci6614 too...

-- 
Denys


On Mon, Aug 12, 2013 at 06:22:11PM -0400, Nelson, Sam wrote:
> Denys,
> This is blocking the MCSDK 3.0.2 & SCMCSDK-2.2.0 releases and appreciate any 
> help in resolving this issue.
> 
> With regards,
> Sam
> 
> -----Original Message-----
> From: Nelson, Sam 
> Sent: Monday, August 12, 2013 12:27 PM
> To: Dmytriyenko, Denys
> Cc: 'meta-arago@arago-project.org'; Sivarajan, Raj; ares-team@list.ti.com - Raj Sivarajan's Team (May contain non-TIers)
> Subject: RE: help needed: Top nightly failure
> 
> Also  yocto builds using git://arago-project.org/git/projects/linux-tci6614.git also failing for the past 3 days.
> 
> Looks like there is no issue in cloning the repos. But only the yocto fetch operation is failing.
> 
> From the logs there is no information about what is the actual command , which failed.
> With regards,
> Sam
> -----Original Message-----
> From: Nelson, Sam 
> Sent: Monday, August 12, 2013 10:57 AM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org; Sivarajan, Raj; ares-team@list.ti.com - Raj Sivarajan's Team (May contain non-TIers)
> Subject: RE: help needed: Top nightly failure
> Importance: High
> 
> Hello Denys,
> Now starting Thursday, our builds are failing now consistently.
> Did something change in the repos? 
> WARNING: Failed to fetch URL git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=current/master, attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
> Cloning into bare repository '/home/a0862859/yocto/oe-layersetup-mcsdk/downloads/git2/arago-project.org.git.projects.linux-keystone.git'...
> 
> fatal: The remote end hung up unexpectedly
> fatal: early EOF
> fatal: index-pack failed
> 
> ERROR: Function failed: Fetcher failure for URL: 'git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=current/master'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/a0862859/yocto/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/keystone_evm-oe-linux-gnueabi/linux-keystone-3.8.4-r6a/temp/log.do_fetch.31058
> ERROR: Task 684 (/home/a0862859/yocto/oe-layersetup-mcsdk/sources/meta-ti/recipes-kernel/linux/linux-keystone_3.8.4.bb, do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 3212 tasks of which 3211 didn't need to be rerun and 1 failed.
> No currently running tasks (351 of 3340)
> 
> With regards,
> Sam
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, August 08, 2013 10:09 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org; Sivarajan, Raj
> Subject: Re: help needed: Top nightly failure
> 
> Sam,
> 
> Please use a mirror and/or previously cloned repos from downloads/ directory - cloning the entire tree every night is not recommended and is rather abusive.
> 
> Also, I've repacked the linux-keystone repository so it is now smaller - please let me know if you still see the problem.
> 
> --
> Denys
> 
> 
> On Fri, Aug 02, 2013 at 06:20:08AM -0400, Nelson, Sam wrote:
> >    Hello All
> > 
> >     
> > 
> >    We are encountering a lot of nightly failures with fetch failure like the
> >    following from the arago-project git.  The error happens randomly and
> >    unpredictably.
> > 
> >    Is this something to do with git servers going down/offline?
> > 
> >    Any ideas in tracking this type of issue will be appreciated.
> > 
> >     
> > 
> >    With regards,
> > 
> >    Sam
> > 
> >     
> > 
> >    ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
> > 
> >    Cloning into bare repository
> >    '/home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-layersetup-mcsdk/downloads/git2/arago-project.org.git.projects.linux-keystone.git'...
> > 
> >     
> > 
> >    fatal: The remote end hung up unexpectedly
> > 
> >    fatal: early EOF
> > 
> >    fatal: index-pack failed
> > 
> >     
> > 
> >    ERROR: Function failed: Fetcher failure for URL:
> >    'git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=july-2013b/master'.
> >    Unable to fetch URL from any source.
> > 
> >    ERROR: Logfile of failure stored in:
> >    /home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/keystone_evm-oe-linux-gnueabi/linux-keystone-3.8.4-r6a/temp/log.do_fetch.14929
> > 
> >     

