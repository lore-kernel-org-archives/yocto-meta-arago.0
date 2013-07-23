Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7DD9652972
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 23:59:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NNxZb5016956;
	Tue, 23 Jul 2013 18:59:35 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NNxZi2023184;
	Tue, 23 Jul 2013 18:59:35 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 18:59:35 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6NNxYqs032083;
	Tue, 23 Jul 2013 18:59:35 -0500
Date: Tue, 23 Jul 2013 19:59:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Christian Gagneraud <chgans@gna.org>
Message-ID: <20130723235934.GF32068@edge>
References: <1331708251.407.1374386154381.JavaMail.jenkins@puget>
	<51EDE9D0.2000003@gna.org> <20130723031524.GA30573@edge>
	<51EE0A0A.3020902@gna.org> <20130723060244.GA31158@edge>
MIME-Version: 1.0
In-Reply-To: <20130723060244.GA31158@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [nightly] Core TISDK 2013.06 build 2013-07-21_01-01-44
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
X-List-Received-Date: Tue, 23 Jul 2013 23:59:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 23, 2013 at 02:02:45AM -0400, Denys Dmytriyenko wrote:
> On Tue, Jul 23, 2013 at 04:43:54PM +1200, Christian Gagneraud wrote:
> > On 23/07/13 15:15, Denys Dmytriyenko wrote:
> > >Christian,
> > >
> > >On Tue, Jul 23, 2013 at 02:26:24PM +1200, Christian Gagneraud wrote:
> > >>Hi there,
> > >>
> > >>I have been looking at these test/build reports recently, is there a
> > >>more detail report available somewhere?
> > >
> > >Yes, but detailed reports are not yet published externally - it's on my
> > >"to do" list.
> > 
> > Good to hear, thanks! I have no strong needs for this, i was just
> > curious about the am335x-evm test failures.
> > 
> > >
> > >
> > >>As a user of a am335x-evm and a BeagleBoard Black, I would like to
> > >>know more about test failure for the EVM.
> > >
> > >There are some issues with the boot sequence of an automated test - looks
> > >like it's trying to load a wrong kernel image, I'll look into it later.
> > >Otherwise, the latest Dylan build works and boots fine for me on am335x-evm
> > >when loaded manually on SD card.

So, the issue with am335x-evm tests failining was identified as a bug in the 
test automation framework and our System Test engineers are working on the 
fix. For more details:

http://arago-project.org/pipermail/opentest/2013-July/002031.html


> > >>As well, I'm considering moving from Arago/Danny (kernel 3.2) to
> > >>Arago/Dylan (kernel 3.8?). I would like to know if there are any
> > >>plan to use Dylan for the next stable Arago.
> > >
> > >Actually, Arago/Danny has been using kernel 3.8 for quite some time now - we
> > >already had couple internal releases with it. You would need to specifically
> > >request AM-SDK branding to get 3.2 kernel, as the default is 3.8 in Danny and
> > >in Dylan. The only change Dylan brings is to update the underlying Yocto
> > >framework with all the user-space apps to the latest versions.
> > 
> > Yes, that's right, Arago/Danny already use kernel 3.8. My mistake!
> > To be more precise, my question was related to QA stuff. For now,
> > build and test automation are still done with Arago/Danny, any plan
> > to switch to or add Arago/Dylan config?
> 
> Yes, indeed - that's the next step. I still need to finish the devkit portion 
> of our SDK, but otherwise everything seems to be getting ready to switch the 
> nightly builds and tests to using Dylan.
> 
> 
> > On the side, any plan to add beaglebone and/or beaglebone-black to
> > the list of machines used by your continuous integration systems?
> 
> Starting with kernel 3.8, the only difference between AM335 EVM, EVM-SK and 
> Beaglebone is in the devtree. When we build for am335x-evm, we copy all the 
> DTBs, so the same images can be used on SK or Beaglebone. No need to build for 
> those separately!
> 
> From a run-time testing perspective, those are obviously different tests on 
> actual boards - I would need to check the board farm for proper setup. BTW, 
> current nightly tests are sent to our internal board farm, which is shared. I 
> am working on setting up my own personal board farm - I do have all the 
> boards, I just need to whip our automation software in shape, which is not an 
> easy task...
> 
> 
> > >>Also, do you think it is conceivable to hope for a working Qt5 with
> > >>TI OpenGL stuff?
> > >
> > >It's in the plans. Prabu was able to get it built after some massaging, but
> > >there are still few issues. Also, we would need to make sure the fallback
> > >mechanism works for legacy devices w/o GLES, since Qt5 requires it...
> > 
> > Interesting! What I found so far:
> >  - https://github.com/prabindh/qt-configs
> >  - http://e2e.ti.com/search/default.aspx#q=qt5&g=29&sc=forum
> >  - and of course https://github.com/meta-qt5/meta-qt5, which depends
> > on oe master :(
> > 
> > What I would like to achieve by the next months is to provide an
> > {arago|angstrom|poxy}-danny-qt5 SDK and custom rootfs to the dev
> > guys. Will see how it goes!
> 
> Let us know how it goes. And patches are welcome, as usual!
> 
> -- 
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

