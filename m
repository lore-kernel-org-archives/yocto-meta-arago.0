Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CE7AD529A2
	for <meta-arago@arago-project.org>;
	Wed,  4 Sep 2013 17:59:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r84Hx4r0027513
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2013 12:59:04 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r84Hx4gF010403
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2013 12:59:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Sep 2013 12:59:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r84Hx3VP030313;
	Wed, 4 Sep 2013 12:59:04 -0500
Date: Wed, 4 Sep 2013 13:59:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Saran, Sajesh Kumar" <sajesh@ti.com>
Message-ID: <20130904175903.GB25135@edge>
References: <8EAE6244CE843044A42356038645C85515771EE7@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8EAE6244CE843044A42356038645C85515771EE7@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: QA issue while packaging DSP images
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
X-List-Received-Date: Wed, 04 Sep 2013 17:59:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 04, 2013 at 05:33:32PM +0000, Saran, Sajesh Kumar wrote:
> Hi,
> 
> I am getting QA issue when I try to package DSP images in /lib/firmware directory.
> 
> In the recipe I have added following
> 
> INHIBIT_PACKAGE_STRIP = "1"
> INSANE_SKIP_${PN} = "True"
> FILES_${PN}_append = "${base_libdir}"
> FILES_${PN} += "${base_libdir}/firmware"
> FILES_${PN} += "${base_libdir}/firmware/dsp-core0.out"
> FILES_${PN} += "${base_libdir}/firmware/dsp-core1.out"
> FILES_${PN} += "${base_libdir}/firmware/dsp-core2.out"
> FILES_${PN} += "${base_libdir}/firmware/dsp-core3.out"
> 
> I see following error in the log
> NOTE: DO PACKAGE QA
> NOTE: Checking Package: ti-tci6614-remoteproc-dbg
> NOTE: Checking Package: ti-tci6614-remoteproc-staticdev
> NOTE: Checking Package: ti-tci6614-remoteproc-dev
> NOTE: Checking Package: ti-tci6614-remoteproc-doc
> NOTE: Checking Package: ti-tci6614-remoteproc-locale
> NOTE: Package ti-tci6614-remoteproc skipping QA tests: ['True']
> NOTE: Checking Package: ti-tci6614-remoteproc
> ERROR: QA Issue: Architecture did not match (40 to 140) on /work/armv7ahf-vfp-neon-oe-linux-gnueabi/ti-tci6614-remoteproc-1.0-r1/packages-split/ti-tci6614-remoteproc/lib/firmware/dsp-core0.out
> ERROR: QA run found fatal errors. Please consider fixing them.
> DEBUG: Python function do_package_qa finished
> 
> Is there any other flags to suppress this check?

"True" is not a correct QA test hence your INSANE_SKIP does not work.

So, the error "Architecture did not match" means that your recipe says it 
builds binaries for the target architecture, which is Linux ELF 32bit ARM. 
Your binaries are not of the same arch. But we don't have an architecture 
defined for DSP binaries. So, you can mark your recipe as machine-specific 
(PACKAGE_ARCH=MACHINE_ARCH) and listing "arch" test case in the INSANE_SKIP, 
which is a list of cases to skip during QA check.

-- 
Denys

