Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 364CE52A38
	for <meta-arago@arago-project.org>;
	Wed, 31 Jul 2013 22:21:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6VMLw1R002668
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 17:21:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6VMLwGS003342
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 17:21:58 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 31 Jul 2013 17:21:57 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6VMLvjQ004652;
	Wed, 31 Jul 2013 17:21:57 -0500
Date: Wed, 31 Jul 2013 18:21:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Saran, Sajesh Kumar" <sajesh@ti.com>
Message-ID: <20130731222156.GB13691@edge>
References: <8EAE6244CE843044A42356038645C8551573CB16@DFLE12.ent.ti.com>
	<20130725202449.GD2222@edge>
	<8EAE6244CE843044A42356038645C8551573D779@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8EAE6244CE843044A42356038645C8551573D779@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: compiling a native (x86) application using Yocto
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
X-List-Received-Date: Wed, 31 Jul 2013 22:22:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sajesh,

It appears your Makefile directly calls native gcc to produce x86 binary.

Now, BBCLASSEXTEND allows you to "extend" a regular target recipe that 
produces an ARM binary to also produce a native x86 binary. Naming your recipe 
as something-native.bb doesn't change the procedure.

So, it first builds and strips an ARM binary and then would have done the same 
for x86 binary. But since you set GCC=gcc in your Makefile, it chokes on the 
ARM-stripping step.

Now, if you only want a native recipe, instead of BBCLASSEXTEND, you should 
just do "inherit native" and that class would short-circuit all the target 
build and strip tasks.

-- 
Denys


On Thu, Jul 25, 2013 at 04:30:07PM -0400, Saran, Sajesh Kumar wrote:
> Recipe is attached with the mail.
> 
> Regards,
> Sajesh
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, July 25, 2013 4:25 PM
> To: Saran, Sajesh Kumar
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] compiling a native (x86) application using Yocto
> 
> On Wed, Jul 24, 2013 at 06:26:48PM +0000, Saran, Sajesh Kumar wrote:
> > Hi,
> > 
> > I am trying to compile a native tool/application using Yocto.
> > 
> > I have added BBCLASSEXTEND = "native" to the recipe. The compilation 
> > goes thru fine. But, in do_package_qa it is running a strip command 
> > using arm-linux-gnueabihf-strip, which is failing because the 
> > application is compiled using gcc. Do I have to anything else to fix of this issue?
> 
> Strange, that should be enough... Care to share the recipe?
> 
> --
> Denys



