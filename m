Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D84C152998
	for <meta-arago@arago-project.org>;
	Wed, 10 Jul 2013 16:33:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6AGX0Kp006818
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2013 11:33:00 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6AGWxf9032027
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2013 11:32:59 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Jul 2013 11:32:59 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6AGWxbp013842;
	Wed, 10 Jul 2013 11:32:59 -0500
Date: Wed, 10 Jul 2013 12:32:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20130710163258.GB16407@edge>
References: <4F9216F96E5DF9428610502835A9F49054937C49@DLEE11.ent.ti.com>
	<20130709154017.GD14185@edge>
	<4F9216F96E5DF9428610502835A9F49054937C6E@DLEE11.ent.ti.com>
	<20130709160710.GF14185@edge>
	<4F9216F96E5DF9428610502835A9F49054937CD9@DLEE11.ent.ti.com>
	<20130709183745.GM14185@edge>
	<4F9216F96E5DF9428610502835A9F490549380FD@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F490549380FD@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Karicheri,
	Muralidharan" <m-karicheri2@ti.com>, "Shilimkar,
	Santosh" <santosh.shilimkar@ti.com>
Subject: Re: Help needed: Devkit header files not upto date with kernel headers
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
X-List-Received-Date: Wed, 10 Jul 2013 16:33:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 10, 2013 at 12:02:35PM -0400, Nelson, Sam wrote:
> If I have to back port, can you give me a list of files I may need to merge.

Sam,

Just one file linux-libc-headers_3.8.bb should be enough.

-- 
Denys


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, July 09, 2013 2:38 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org; Karicheri, Muralidharan; Shilimkar, Santosh
> Subject: Re: Help needed: Devkit header files not upto date with kernel headers
> 
> On Tue, Jul 09, 2013 at 02:18:24PM -0400, Nelson, Sam wrote:
> > Thanks for the detailed information.
> > So  to update the headers I need to make changes in the linux-libc-headers recipe?
> > 
> > Specifically, any update needed in
> > oe-core/meta/recipes-kernel/linux-libc-headers/linux-libc-header.inc
> > or
> > do I need to add a new recipe for the 3.8.4 header similar to the other recipes?
> > 
> > oe-core/meta/recipes-kernel/linux-libc-headers$ ls
> > linux-libc-headers           linux-libc-headers_3.4.3.bb
> > linux-libc-headers_3.0.8.bb  linux-libc-headers.inc 
> > linux-libc-headers_3.2.bb
> > 
> > Any guidelines on what to update to get the latest headers for 3.8.4 kernel will be helpful.
> 
> The easiest solution is to switch to using Dylan branches, once meta-arago is fully converted in the near future, which gives you linux-libc-headers-3.8 for free. Another option is to back-port it to Danny.
> 
> --
> Denys
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys 
> > Sent: Tuesday, July 09, 2013 12:07 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org; Karicheri, Muralidharan; Shilimkar, Santosh
> > Subject: Re: Help needed: Devkit header files not upto date with kernel headers
> > 
> > Sam,
> > 
> > Please see my last comment - there's a separate recipe for user-space kernel headers. The headers need to be properly exported, you cannot just use the ones from the kernel directly. Hence they are detached - updating the header in the kernel tree does not automatically update exported headers for the user space in linux-libc-headers.
> > 
> > -- 
> > Denys
> > 
> > 
> > On Tue, Jul 09, 2013 at 12:00:34PM -0400, Nelson, Sam wrote:
> > > Understand the user space headers and kernel space headers are different in 
> > > general. But in this case, I am comparing the files under "uapi" directory. 
> > > Which I assume is actually meant for user space api. Am I wrong on this? 
> > > Given that , I expected the header file will be updated in building the 
> > > devkit.
> > > 
> > > For example if we have update on an "uapi" header file , as part of a kernel 
> > > patch, Don't we expect the corresponding header file in devkit to be 
> > > updated? Appreciate your comments.
> > > 
> > > With regards,
> > > Sam
> > > 
> > > 
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys 
> > > Sent: Tuesday, July 09, 2013 11:40 AM
> > > To: Nelson, Sam
> > > Cc: meta-arago@arago-project.org; Karicheri, Muralidharan; Shilimkar, Santosh
> > > Subject: Re: Help needed: Devkit header files not upto date with kernel headers
> > > 
> > > On Tue, Jul 09, 2013 at 11:30:35AM -0400, Nelson, Sam wrote:
> > > >    Hello all,
> > > > 
> > > >    The header files under sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi does
> > > >    not match the same file from the kernel tree.
> > > 
> > > That's normal. There's a difference between kernel and user-space facing headers.
> > > 
> > > http://kernelnewbies.org/KernelHeaders
> > > 
> > > 
> > > >    For example
> > > > 
> > > >    Comparing the following 2 files, they are different.
> > > > 
> > > >    
> > > > sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi/usr/include/linux/ethtool.
> > > > h
> > > > 
> > > >    and
> > > > 
> > > >    
> > > > sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi/usr/src/kernel/include/uap
> > > > i/linux/ethtool.h
> > > > 
> > > >     
> > > > 
> > > >    Looking into some details, the /usr/include/linux/ethtool.h, seems to come
> > > >    from the libc package.
> > > 
> > > Yes, those are different even on my host machine. The first is marked as _LINUX_ETHTOOL_H and the second one as _UAPI_LINUX_ETHTOOL_H
> > > 
> > > http://lwn.net/Articles/113349/
> > > http://lwn.net/Articles/507794/
> > > 
> > > 
> > > >    Any ideas on what can be wrong in the recipes will be helpful.  Is there
> > > >    any way to update the user space header files to match the kernel header
> > > >    files?
> > > 
> > > There is a special recipe for that - linux-libc-headers.
> > > 
> > > --
> > > Denys

