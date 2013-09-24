Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2A1585296F
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 00:44:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8O0i6dq027000
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 19:44:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O0i6vX027594
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 19:44:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 23 Sep 2013 19:44:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O0i6QD010416;
	Mon, 23 Sep 2013 19:44:06 -0500
Date: Mon, 23 Sep 2013 20:44:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130924004405.GB4390@edge>
References: <1379703595-1330-1-git-send-email-denis@denix.org>
	<20EC9FB1-3555-4CE0-9D7A-A45365A6A555@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C558340@DFLE08.ent.ti.com>
	<20130920205310.GE30673@edge>
	<7D46E86EC0A8354091174257B2FED10159741920@DLEE11.ent.ti.com>
	<20130923175530.GF3456@edge>
	<8F29D6B095ED194EA1980491A5E029710C55B058@DFLE08.ent.ti.com>
	<20130923213708.GJ3456@edge>
	<6D604C4F-E8C8-4A02-93C7-4AE2F4A4128D@ti.com>
MIME-Version: 1.0
In-Reply-To: <6D604C4F-E8C8-4A02-93C7-4AE2F4A4128D@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sourceipk: do not dereference symlinks when packaging data to avoid breakage
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
X-List-Received-Date: Tue, 24 Sep 2013 00:44:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 23, 2013 at 06:09:02PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > On Sep 23, 2013, at 4:37 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> > 
> >> On Mon, Sep 23, 2013 at 04:12:37PM -0400, Cooper Jr., Franklin wrote:
> >> 
> >> 
> >>> -----Original Message-----
> >>> From: Dmytriyenko, Denys
> >>> Sent: Monday, September 23, 2013 12:56 PM
> >>> To: Maupin, Chase
> >>> Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> >>> Subject: Re: [meta-arago] [PATCH] sourceipk: do not dereference symlinks
> >>> when packaging data to avoid breakage
> >>> 
> >>> On Mon, Sep 23, 2013 at 11:34:46AM -0400, Maupin, Chase wrote:
> >>>>> -----Original Message-----
> >>>>> From: Dmytriyenko, Denys
> >>>>> Sent: Friday, September 20, 2013 4:53 PM
> >>>>> To: Cooper Jr., Franklin
> >>>>> Cc: Maupin, Chase; Denys Dmytriyenko; meta-arago@arago-project.org
> >>>>> Subject: Re: [meta-arago] [PATCH] sourceipk: do not dereference
> >>>>> symlinks when packaging data to avoid breakage
> >>>>> 
> >>>>> On Fri, Sep 20, 2013 at 08:49:00PM +0000, Cooper Jr., Franklin
> >>>>> wrote:
> >>>>>> 
> >>>>>> 
> >>>>>>> -----Original Message-----
> >>>>>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >>>>>>> bounces@arago-project.org] On Behalf Of Maupin, Chase
> >>>>>>> Sent: Friday, September 20, 2013 3:31 PM
> >>>>>>> To: Denys Dmytriyenko
> >>>>>>> Cc: meta-arago@arago-project.org
> >>>>>>> Subject: Re: [meta-arago] [PATCH] sourceipk: do not
> >>>>> dereference symlinks
> >>>>>>> when packaging data to avoid breakage
> >>>>>>> 
> >>>>>>> Will this still package things like the patches applied on top
> >>>>> of the kernel in the
> >>>>>>> kernel sources?
> >>>>>> 
> >>>>>> [Franklin] Good call. Your right it doesn't. I gave it a shot
> >>>>> and the
> >>>>>> symbolic link remains but of course the link is broken if it is
> >>>>> used on a
> >>>>>> different machine.
> >>>>> 
> >>>>> Yeah, I had the same question originally. Unfortunately, you cannot
> >>>>> assume there are no broken links in the sources to begin with. And
> >>>>> those broken symlinks cannot be dereferenced w/o breaking the entire
> >>>>> tar command and hence the build. That is what we discussed couple
> >>>>> days ago - kernel now has a broken symlink that kills our
> >>>>> sourceipk...
> >>>>> 
> >>>>> Why do patches symlinked and not copied? Can we fix that step instead
> >>>>> of doing it in tar command?
> >>>> 
> >>>> For most builds I think the idea is not to have multiple copies of the
> >>>> patches.  But we wanted to provide those patches in the sources we ship.
> >>>> That was why the symlink we dereferenced to provide the real file and
> >>>> not a pointer to the patch.  So I'm not sure that it is a good idea to
> >>>> always copy patches instead of symlink as most people probably won't care.
> >>> 
> >>> This paragraph is somewhat confusing. It sounds like the patch handling is done
> >>> by sourceipk class, which is not.
> >>> 
> >>> Anyway, the ${S}/patches/ directory gets created and patches are symlinked
> >>> there by the core framework to make quilt happy. Unfortunately, there are no
> >>> flags or variables to copy patches instead of symlinking them, or affect that code
> >>> in other way. So, sourceipk class just piggy-backs on the above code to prep
> >>> quilt series.
> >>> 
> >>>> Is there a way to bypass the error?  Maybe something like
> >>>> --ignore-command-error?  I'm not sure what changed that created this
> >>>> issue so I'm not sure if this applies.
> >>> 
> >>> Unfortunately, no, that flag doesn't help. What changed is that kernel sources
> >>> now contain a symlink that is currently broken. But I'm arguing that it's not
> >>> kernel's fault, as having symlinks pointing nowhere in package sources should be
> >>> allowed. In other words, symlinks in patches/ directory is a special case and
> >>> handling them by dereferencing should not extend on the rest of the sources.
> >>> 
> >>> So, I'm thinking on possible ways to solve this - either patch the framework to
> >>> copy patches instead of symlinking them or prep the patches/ directory before
> >>> tarring up the sources for the sourceipk case...
> > 
> >> [Franklin] I didn't notice before but sourceipk copies the sources in a 
> >> completely different directory before the tar command is ran. So how about 
> >> simply searching for broken symlink and then deleting them. Afterwards the 
> >> tar command can run as is.
> > 
> > You are missing the point - it _may_ be valid to have broken symlinks in the 
> > source tree. We should not fail while packaging those and we should not 
> > deliberately remove them

> I'll take your word for it then since I don't understand why anyone would 
> want to do that.
> 
> I think prepping the patches directory would be the best solution.

I'm not saying it is correct or desirable to have a broken symlink in the 
sources directory. I'm just saying we should not mangle the sources at all - 
keep them as they are, even if there are broken symlinks in them. Since the 
patches/ directory is added externally and that's the one we care about, we 
should dereference just that with inside patches and leave the rest untouched.

-- 
Denys


> >>>>>>> On Sep 20, 2013, at 2:00 PM, "Denys Dmytriyenko"
> >>>>> <denis@denix.org> wrote:
> >>>>>>> 
> >>>>>>>> From: Denys Dmytriyenko <denys@ti.com>
> >>>>>>>> 
> >>>>>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>>>>>>> ---
> >>>>>>>> meta-arago-distro/classes/sourceipk.bbclass | 2 +-
> >>>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>> 
> >>>>>>>> diff --git a/meta-arago-distro/classes/sourceipk.bbclass
> >>>>> b/meta-arago-
> >>>>>>> distro/classes/sourceipk.bbclass
> >>>>>>>> index 1ea0577..777cb4f 100644
> >>>>>>>> --- a/meta-arago-distro/classes/sourceipk.bbclass
> >>>>>>>> +++ b/meta-arago-distro/classes/sourceipk.bbclass
> >>>>>>>> @@ -167,7 +167,7 @@ sourceipk_do_create_srcipk() {
> >>>>>>>>        fi
> >>>>>>>> 
> >>>>>>>>        #Write the data tarball
> >>>>>>>> -        tar -C $tmp_dir --owner=0 --group=0 -chzf
> >>>>> $srcipk_dir/data.tar.gz .
> >>>>>>>> +        tar -C $tmp_dir --owner=0 --group=0 -czf
> >>>>> $srcipk_dir/data.tar.gz .
> >>>>>>>> 
> >>>>>>>>        # Create the debian-binary file
> >>>>>>>>        echo "2.0" > $srcipk_dir/debian-binary
> >>>>>>>> --
> >>>>>>>> 1.8.3.2
> >>>>>>>> 
> >>>>>>>> _______________________________________________
> >>>>>>>> meta-arago mailing list
> >>>>>>>> meta-arago@arago-project.org
> >>>>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>>>>>> _______________________________________________
> >>>>>>> meta-arago mailing list
> >>>>>>> meta-arago@arago-project.org
> >>>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>>>>> _______________________________________________
> >>>>>> meta-arago mailing list
> >>>>>> meta-arago@arago-project.org
> >>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

