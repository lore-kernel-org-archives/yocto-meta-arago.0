Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 0DD4252AA8
	for <meta-arago@arago-project.org>;
	Tue,  7 Feb 2017 21:00:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v17L0NMd023712;
	Tue, 7 Feb 2017 15:00:23 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v17L0NLv011897;
	Tue, 7 Feb 2017 15:00:23 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 15:00:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v17L0NHQ029519;
	Tue, 7 Feb 2017 15:00:23 -0600
Date: Tue, 7 Feb 2017 16:00:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20170207210020.GA32691@edge>
References: <CADySD0FEFTwomoxgH9hhP97vxkW5aH5EJqh4h1+_thpS5cPsFQ@mail.gmail.com>
	<20170203003337.GA19545@edge>
	<CADySD0Hr2rmA8Eu6bdngmEMri67Fc7_2JiFhJmQWTYhAb0CO1w@mail.gmail.com>
	<CADySD0Ht7tH=QC6C6r2f-PgTX1P192x5o0jry8yo-Fe6OVk3mQ@mail.gmail.com>
	<CADySD0Huh=wkgE8wNtp0b3Hv5_2c9D3ZYvmx9=UWK6A8zJpLpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0Huh=wkgE8wNtp0b3Hv5_2c9D3ZYvmx9=UWK6A8zJpLpA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: How to remove linux headers from rootfs
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
X-List-Received-Date: Tue, 07 Feb 2017 21:00:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Something is depending on those dev packages as dependencies - you need to 
figure out what that is. Do you have packagegroup-core-buildessential pulled 
into your rootfs by any chance? Otherwise, you can run bitbake with -g flag 
and examine resulting *.dot files for dependencies.

-- 
Denys


On Tue, Feb 07, 2017 at 05:26:56PM +1300, Ankur Tyagi wrote:
> Hi,
> 
> Any suggestions on how to remove these packages from my rootfs ?
> 
> I know daisy is old but my current sdk is based upon it. I am in
> process of evaluating morty but it will take time.
> Until then, I would like to tune my current rootfs.
> 
> thanks
> Ankur
> 
> On Sun, Feb 5, 2017 at 11:02 AM, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> > To add more, linux-libc-headers  indeed produce linux-libc-headers-dev
> >
> > bitbake -e linux-libc-headers | grep "^PACKAGES="
> > PACKAGES="linux-libc-headers-dbg linux-libc-headers-staticdev
> > linux-libc-headers-dev linux-libc-headers-doc
> > linux-libc-headers-locale  linux-libc-headers"
> >
> > And forgot to mention that I am using *daisy* branch..
> >
> > On Sun, Feb 5, 2017 at 10:42 AM, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> >> Hi Denys,
> >>
> >> I have following dev packages installed in my rootfs which I don't want
> >>
> >> - linux-libc-headers-dev
> >> - libgcc-s-dev
> >> - libc6-dev
> >>
> >> I haven't explicitly added any -dev package.
> >> How can I remove them ?
> >>
> >> Thanks
> >> Ankur
> >>
> >> On Fri, Feb 3, 2017 at 1:33 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> >>> On Fri, Feb 03, 2017 at 01:26:38PM +1300, Ankur Tyagi wrote:
> >>>> Hi,
> >>>>
> >>>> I have an image recipe which include packagegroup-core-boot which
> >>>> brings in external-linaro-toolchain which in turn adds
> >>>> linux-libc-headers.
> >>>>
> >>>> How can I remove linux-libc-headers from my end root FS ?
> >>>
> >>> linux-libc-headers is an empty package. linux-libc-headers-dev is the one that
> >>> contains all the standard headers required for development. Which one you have?
> >>>
> >>> --
> >>> Denys

