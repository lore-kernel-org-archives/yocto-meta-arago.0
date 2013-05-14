Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 72BC652A39
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2013 23:40:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4ENelYi012265
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 18:40:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4ENelXk015342
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 18:40:47 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 18:40:47 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r4ENelBg014886;
	Tue, 14 May 2013 18:40:47 -0500
Date: Tue, 14 May 2013 19:40:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20130514234046.GB19353@edge>
References: <1368536896-27356-1-git-send-email-sam.nelson@ti.com>
	<20130514165428.GD18680@edge>
	<4F9216F96E5DF9428610502835A9F4905491F683@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905491F683@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Recipe: Adding pciutils package
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
X-List-Received-Date: Tue, 14 May 2013 23:40:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

On Tue, May 14, 2013 at 02:34:45PM -0400, Nelson, Sam wrote:
> I am still new to this. So pardon my questions inline.

There's no shame in being new to this. But keeping discussion on the list 
might get you the answer quicker - some common things can be answered by 
other people and you don't have to wait for me to find a spare minute...

I hope you don't mind me copying the list, as this is useful information below 
for others as well.


> On Tue, May 14, 2013 at 09:08:16AM -0400, Sam Nelson wrote:
> >    pciutils provides very basic utilities for
> >    querying the devices on the pci bus, when pci
> >    interface is supported in the platform and
> >    useful to be part of the console package
> 
> Sam,
> 
> This looks very good!
> 
> Few more nit-picks:
> 
> 0. Again, the subject line should follow the OE Community guidelines:
> http://openembedded.org/wiki/Commit_Patch_Message_Guidelines
> We've discussed it already here:
> http://arago-project.org/pipermail/meta-arago/2013-May/001373.html
> 
> 1. If you are re-sending a new revision of the patch, please update the 
> subject to contain [PATCHv2] or [PATCHv3] etc. Also you can log the changes 
> between patch revisions after --- mark.
> >> How do I do this. I just use git send-email.  Appreciate your help.

There are few useful flags to git-format-patch:

 --subject-prefix=<Subject-Prefix>
     Instead of the standard [PATCH] prefix in the subject line, instead use
     [<Subject-Prefix>]. This allows for useful naming of a patch series, and 
     can be combined with the --numbered option.

 -v <n>, --reroll-count=<n>
     Mark the series as the <n>-th iteration of the topic. The output 
     filenames have v<n> prepended to them, and the subject prefix ("PATCH" by 
     default, but configurable via the --subject-prefix option) has ` v<n>` 
     appended to it. E.g. --reroll-count=4 may produce v4-0001-add-makefile.patch 
     file that has "Subject: [PATCH v4 1/20] Add makefile" in it.

 --notes[=<ref>]
     Append the notes (see git-notes(1)) for the commit after the three-dash 
     line.

     The expected use case of this is to write supporting explanation for the 
     commit that does not belong to the commit log message proper, and include 
     it with the patch submission. While one can simply write these 
     explanations after format-patch has run but before sending, keeping them 
     as Git notes allows them to be maintained between versions of the patch 
     series (but see the discussion of the notes.rewrite configuration options 
     in git-notes(1) to use this workflow).

But sometimes it's easier to make those changes manually, as long as you don't 
mangle the actual patch - make sure your text editor does not re-format the 
patch while editing, does not introduce new line breaks or wraps long lines.


> 2. This recipe now becomes machine-specifci, so please add at the top:
> PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> DONE.

Good.


> 3. And please don't forget to add "pci" to the list of MACHINE_FEATURES for 
> your machine (keystone-evm.conf) or better yet your SOC (keystone.inc)

> Yes. I have taken care of this in the meta-ti keystone.inc. Thanks.

And please use proper quoting - sometimes it's hard to figure out if it's your 
comment or mine or someone else's from before...

-- 
Denys

