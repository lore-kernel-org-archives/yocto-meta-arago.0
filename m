Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id F012E529EA
	for <meta-arago@arago-project.org>;
	Tue, 10 May 2016 19:14:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4AJE1d1000791
	for <meta-arago@arago-project.org>; Tue, 10 May 2016 14:14:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4AJE1lV009284
	for <meta-arago@arago-project.org>; Tue, 10 May 2016 14:14:01 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 May 2016 14:14:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4AJE0HX017783;
	Tue, 10 May 2016 14:14:01 -0500
Date: Tue, 10 May 2016 15:13:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20160510191345.GJ16188@edge>
References: <1462802934-30099-1-git-send-email-denis@denix.org>
	<4B26FB5A64EBA14C87266869E037F9581426EDC8@DFLE09.ent.ti.com>
	<f9be806e-8324-4b97-a889-c7028746ca0e@email.android.com>
MIME-Version: 1.0
In-Reply-To: <f9be806e-8324-4b97-a889-c7028746ca0e@email.android.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] systemd: provide symlink to libudev.so.0, required by SGX libs/bins
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
X-List-Received-Date: Tue, 10 May 2016 19:14:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I'm back at the keyboard, so a bit of clarification. I've been doing distros 
for at least 20 years and OpenEmbedded for almost 10. I was right in the 
middle of it, when the original OE versioning policy was drafted. At the time, 
Arago Project has already started using -nameX suffix with Classic OE. I know 
we agreed then that in general PR should not contain dashes, although there 
were some specific use cases. Since then it was mostly a matter of habit, but 
I've been meaning to start switching over to using dots instead of dashes.

As of PR service - for short-lived bbappends it wouldn't matter much, as you 
are going to hit the problem of the version going backwards sooner or later. 
Either when you add a bbappend with modified PR, or when you remove it... The 
cleanest solution, as a matter of fact, is to NOT modify PR at all and let PR 
service figure it out. There are some pitfalls in that approach and for better 
results a centralized distributed PR service is preferred over a local one, 
especially when doing many distributed builds like we do. That's why I have a 
dedicated PR service in the new build infrastructure I'm building... We should 
probably connect you and your builds to that one in the future, especially 
since we are thinking of package feeds and maintaining upgrade path across 
releases.

-- 
Denys


On Tue, May 10, 2016 at 02:32:34PM +0000, Dmytriyenko, Denys wrote:
> I know
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Monday, May 09, 2016 10:09 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] systemd: provide symlink to libudev.so.0,
> > required by SGX libs/bins
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > eudev and systemd bumped major version number to libudev.so.1, but SGX
> > has
> > version 0 hardcoded. Symlink for now, until binaries can be rebuilt.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/recipes-core/systemd/systemd_%.bbappend | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-
> > core/systemd/systemd_%.bbappend
> >
> > diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> > b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> > new file mode 100644
> > index 0000000..05c8e34
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> > @@ -0,0 +1,6 @@
> > +PR_append = "-arago0"
> 
> PR_append should begin with a ".", not a "-". Otherwise builds with PR 
> service, and buildhistory will fail as the version goes backwards. 
> http://www.openembedded.org/wiki/Versioning_Policy
> 
> > +
> > +do_install_append() {
> > +    install -d ${D}/${base_libdir}
> > +    ln -sf libudev.so.1 ${D}${base_libdir}/libudev.so.0
> > +}
> > --
> > 2.2.0
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

