Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5294752A4D
	for <meta-arago@arago-project.org>;
	Fri,  3 May 2013 16:28:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r43GSLr1003861
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 11:28:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r43GSLwN028122
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 11:28:21 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 3 May 2013 11:28:21 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r43GSL9T024694;
	Fri, 3 May 2013 11:28:21 -0500
Date: Fri, 3 May 2013 12:28:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>
Message-ID: <20130503162820.GE9213@edge>
References: <ECA334CFBA16F74DB2C66A2F1181F4D63C2B2406@DLEE09.ent.ti.com>
	<20130429172640.GB27211@edge>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B3FFF@DLEE09.ent.ti.com>
	<20130501212128.GB32449@edge>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B46EC@DLEE09.ent.ti.com>
	<3E54258959B69E4282D79E01AB1F32B7044E4A32@DFLE11.ent.ti.com>
	<20130502231437.GK2364@edge>
	<3E54258959B69E4282D79E01AB1F32B7044E4FFC@DFLE11.ent.ti.com>
	<20130503154346.GD9213@edge>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B4A6E@DLEE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <ECA334CFBA16F74DB2C66A2F1181F4D63C2B4A6E@DLEE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Karicheri,
	Muralidharan" <m-karicheri2@ti.com>
Subject: Re: MCSDK rootfs boot directory
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
X-List-Received-Date: Fri, 03 May 2013 16:28:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hao,

The rule is to use the same exact directory structure for .bbappend in our 
layer, as the original .bb recipe in the original layer. Also, it has to have 
the proper version in the name. So, check where the original oprofile recipe 
is located (oe-core/meta/recipes-kernel/oprofile), which version you are using 
(0.9.7) and that will give you the .bbappend name and location:

meta-arago/meta-arago-distro/recipes-kernel/oprofile/oprofile_0.9.7.bbappend

As the name suggests, this file is "appended" to the original recipe, so you 
have a way to overwrite or change anything that is set in the original recipe:

PR_append = "-arago0"
RRECOMMENDS_${PN} = ""

The first line is to update the PR and indicate it has been arago-modified.

PS. This is exactly why this kind of discussion shouldn't be done in private, 
as I keep explaining about bbappend to your team-mates over and over again. 
I'm copying it to meta-arago list, which your team members should be already 
subscribed to.

PS2. And if later you would like to submit this to meta-arago, I'd suggest 
making it conditional for your platform, so others would still get the 
original behaviour:

PR_append = "-arago0"
KERNELIMAGE = "kernel-vmlinux"
KERNELIMAGE_keystone = ""
RRECOMMENDS_${PN} = "${KERNELIMAGE}"

-- 
Denys


On Fri, May 03, 2013 at 11:58:03AM -0400, Zhang, Hao wrote:
> Denys,
> 
> Can you suggest in which directory should I add oprofile.bbappend? Should I 
> add it under meta-arago/meta-arago-distro/recipes-core/oprofile/ 
> oprofile.bbappend? And what is the oprofile version should I use?
> 
> On Fri, May 03, 2013 at 11:42:12AM -0400, Karicheri, Muralidharan wrote:
> > Denys,
> > 
> > So the documentation should state the vmlinux should be copied to the 
> > boot folder of root fs to work with oprofile, right?
> > 
> > >> On Thu, May 02, 2013 at 06:47:23PM -0400, Karicheri, Muralidharan wrote:
> > >> > Is there a way we can still keep oprofile in the Linux? User 
> > >> > should be able to copy vmlinux manually and still use oprofile, right?
> > >> 
> > >> Make a .bbappend for oprofile, and put this in:
> > >> 
> > >> RRECOMMENDS_${PN} = ""
> > >> 
> > >> That will stop it from pulling vmlinux, but make sure you document it 
> > >> for users...

