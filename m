Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DAA8452A6F
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 16:16:50 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MGGnGs012851
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 11:16:49 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MGGncU017179
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 11:16:49 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 11:16:49 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7MGGnh6012036;
	Wed, 22 Aug 2012 11:16:49 -0500
Date: Wed, 22 Aug 2012 12:16:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20120822161648.GB21025@edge>
References: <8F29D6B095ED194EA1980491A5E029710C2A7E8F@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2A7E8F@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: qt4-embedded build issue
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
X-List-Received-Date: Wed, 22 Aug 2012 16:16:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 22, 2012 at 02:17:29AM +0000, Cooper Jr., Franklin wrote:
> Bitbaking qt4-embedded seems to build correctly but resulted in many libraries not being built and a lot of broken sym links.  Looking into the do_compile.log I realized that for libQtGuiE I received this error:
> 
> /home/franklin/toolchain/gcc-linaro-arm-linux-gnueabi-2012.03-20120326_linux/bin/../lib/gcc/arm-linux-gnueabi/4.6.3/../../../../arm-linux-gnueabi/bin/ld: .obj/release-shared-emb-arm/qgrayraster.o: relocation R_ARM_THM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
> .obj/release-shared-emb-arm/qgrayraster.o: could not read symbols: Bad value
> collect2: ld returned 1 exit status
> make[1]: [../../lib/libQtGuiE.so.4.8.0] Error 1 (ignored)
> 
> QtGuiE is needed by several other libraries which is why a lot of the other libraries were not being built. Based on the suggestion of the error and posts such as this http://industriousone.com/topic/issue-placement-fpic-linux I tried to add -fPIC to either CFLAGS or CXXFLAGS. But then I receive an error saying PIC was an invalid option. It seems that fPIC was an option for older versions of gcc but the external linaro toolchain being used doesn't contain this option. Any suggestions on how to fix this?
> 
> FYI building qt4embedded using the built in toolchain doesn't experience this issue.

Strangely, my build of qt4-embedded simply fails with very descriptive 
and now familiar error:

| {standard input}: Assembler messages:
| {standard input}:49: Error: Thumb does not support negative register indexing -- `ldrb r0,[r4,-r12]'
| {standard input}:104: Error: thumb conditional instruction should be in IT block -- `vmuleq.f32 s5,s26,s2'
| {standard input}:105: Error: thumb conditional instruction should be in IT block -- `vdiveq.f32 s5,s5,s3'
| {standard input}:106: Error: thumb conditional instruction should be in IT block -- `vdivne.f32 s5,s2,s3'
| {standard input}:115: Error: thumb conditional instruction should be in IT block -- `vdiveq.f32 s5,s2,s3'

-- 
Denys

