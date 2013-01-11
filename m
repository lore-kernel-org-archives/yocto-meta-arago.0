Return-Path: <paul.kovitz@welchallyn.com>
Received: from na3sys009aog113.obsmtp.com (na3sys009aog113.obsmtp.com
	[74.125.149.209])
	by arago-project.org (Postfix) with ESMTPS id CAF11529D8
	for <meta-arago@arago-project.org>;
	Fri, 11 Jan 2013 23:27:55 +0000 (UTC)
Received: from mail-da0-f71.google.com ([209.85.210.71]) (using TLSv1) by
	na3sys009aob113.postini.com ([74.125.148.12]) with SMTP
	ID DSNKUPCf+rizuX9CtBr3cXEjjaJgHE5PSg/v@postini.com;
	Fri, 11 Jan 2013 15:27:55 PST
Received: by mail-da0-f71.google.com with SMTP id n41so2131545dak.2
	for <meta-arago@arago-project.org>;
	Fri, 11 Jan 2013 15:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=t6tAvbv4gNH3OkhuWiEyxenM8xw87r1QP2W9bOP43kI=;
	b=aC7n0fQIVwCusmwADdubtojgo+WSAYhAA9hMXwmjfbaxkIetsxyEF4CT0eZx4+t4H+
	IH5zpu0INHi4oktPZ9F4c8I1lzjPNqZiHpbZdJuORp1H1sFrSjwRjBbDMabgTZuiq50m
	UBbwvVyEG2B15owZIXtXgAkDYazUMrskfPXgwbo+b3aNHzDytxMcen/3oj9a/5RyNMVH
	OH1cn5CtNeCiHCptKn1IZFDV4b2JaT6X19laBcyge5ubUX9vLbACbeMWJco+c+MRGCFL
	Pdqof4f4wzxkCmGmN0ieWbo9QT4g47C71UK234UOBzzhPzVPFDxAwis3QYpqUdgR9wSO
	3RNA==
X-Received: by 10.66.78.1 with SMTP id x1mr22472725paw.2.1357946873972;
	Fri, 11 Jan 2013 15:27:53 -0800 (PST)
Received: by 10.66.78.1 with SMTP id x1mr22472714paw.2.1357946873857; Fri, 11
	Jan 2013 15:27:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.155.73 with HTTP; Fri, 11 Jan 2013 15:27:13 -0800 (PST)
In-Reply-To: <7D46E86EC0A8354091174257B2FED101593475C5@DLEE12.ent.ti.com>
References: <CA+edY+R9ONv039-fdmdqB7v+POf_ig=ea5-Zhh0=u1s8DPUecw@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101593475C5@DLEE12.ent.ti.com>
From: Paul Kovitz <paul.kovitz@welchallyn.com>
Message-ID: <CA+edY+QUZ9p6G=tR_=rGo0KDu6sJzGx-fFE0XX=UdjX9wWCitA@mail.gmail.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Gm-Message-State: ALoCoQnYIEzhB7AL91EsLX9Zkfsrmv3fPVOvS5lXusQpRziQjxp8imKl4VtBm5GYNAsnHvmPishIsbqyGK+GgBCQj5JZse3Brgl/n/BjFzBTzMnHYuW9bJyxaT2dl9LecyL+z+qY2K0RPfV1w5k8Lssfaf7WCg3o9tes9D0jslY4pQsQSqD4yAg=
X-Mailman-Approved-At: Mon, 11 Feb 2013 19:51:15 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: 805 warning messages when I build 05.06.00.00?
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
Date: Fri, 11 Jan 2013 23:28:00 -0000
X-Original-Date: Fri, 11 Jan 2013 15:27:13 -0800
X-List-Received-Date: Fri, 11 Jan 2013 23:28:00 -0000
X-Groupsio-MsgNum: 842
Content-Type: multipart/mixed; boundary=f46d042f930c0a47b604d30ba56e

--f46d042f930c0a47b604d30ba56e
Content-Type: multipart/alternative; boundary=f46d042f930c0a47b204d30ba56c

--f46d042f930c0a47b204d30ba56c
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Chase.

Took me a while to get back to this.

I am attaching a tarball with all the separate warning files for the other
issues. I created the file manually so I could analyze it better. There are
46 separate log files if I ignore the failed to fetch warnings.

do_populate_lic failed to find the CC-BY-SA license for 14 files in
./all-oe-linux/matrix-gui-* and for
./all-oe-linux-gnueabi/matrix-gui-generic-pm-2.0-r10.0 and for
./armv7a-vfp-neon-oe-linux-gnueabi/matrix-gui-3d-demos-2.0-r10.1

do_populate_lic failed to find the TI-TSPA license
 ./all-oe-linux-gnueabi/wl12xx-firmware-git-r1-gitrol_R5.SP3.05
./am335x_evm-oe-linux-gnueabi/bt-firmware-git-r0+gitrdb43d1f05efda9777d7ac1=
ac366637e29e21f77f

do_populate_lic failed to find the TI-BSP
license armv7a-vfp-neon-oe-linux-gnueabi/am33x-cm3-05.06.00.00-r0-arago0
do_populate_lic failed to find the TSPA
license armv7a-vfp-neon-oe-linux-gnueabi/libgles-omap3-4.08.00.01-r35

The other packages with license issues are debianutiils, iozone3, iperf,
libc-client, nbench, orc and php.

Th ia32-libs warning appears twice for me, but it is not clear to me what
package caused the warnings because I running 8 threads on 8 cores. Is is
do_configure? Here are small snips from the cooker log

NOTE: package libpcre-8.21-r1: task do_configure: Started
WARNING: TI installer requires 32bit glibc libraries for proper operation
run 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on
Ubuntu/Debian

NOTE: Running task 975 of 3742 (ID: 2421,
/home/bone/oe/oe-layersetup/sources/oe-core/meta/recipes-support/lzo/
lzo_2.06.bb, do_configure)
WARNING: TI installer requires 32bit glibc libraries for proper operation
run 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on
Ubuntu/Debian
NOTE: package lzo-2.06-r1: task do_configure: Started

It appears that far as ubunutu is concerned, ia32-libs package is not
available

$ sudo apt-get install ia32-libs
Reading package lists... Done
Building dependency tree
Reading state information... Done
Package ia32-libs is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source

E: Package 'ia32-libs' has no installation candidate

I don't have experience handling this sort of issue. It looks like I can
install ia32-libs-multiarch. Should that do it?

I wonder about some of the other errors, especially the ones about no
GNU_HASH. I sourced the toolchain arago-2011.09/armv7a/evironment-setup
script before I ran bitbake. Should I have just put the toolchain in my
path? I wonder if some of the other environment variables are used
differently by the bitbake recipes.

Thanks for your help

--Paul Kovitz



On Mon, Jan 7, 2013 at 9:12 AM, Maupin, Chase <chase.maupin@ti.com> wrote:

>  ** **
>
> *From:* meta-arago-bounces@arago-project.org [mailto:
> meta-arago-bounces@arago-project.org] *On Behalf Of *Paul Kovitz
> *Sent:* Friday, January 04, 2013 6:19 PM
> *To:* meta-arago@arago-project.org
> *Subject:* [meta-arago] 805 warning messages when I build 05.06.00.00?***=
*
>
> ** **
>
> Greetings. I am new to this list and relatively new to oe, so if this kin=
d
> of post does not belong here, please tell me.****
>
> ** **
>
> I did a build today of the 05.06.00.00 release using this toolchain:****
>
>
> http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09=
/exports/arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
> ****
>
> ** **
>
> There seem to be several classes of warnings. I have questions about all
> of them. Sorry if these were covered under a previous thread. I only went
> back in the archives a few months and didn't see it. ****
>
>    - Failed to fetch from some URL. I assume source was successfully
>    gotten from a mirror, so I can ignore this. True?****
>
> Yes.  Usually this means it didn=92t find the file in one of the mirrors =
and
> will keep falling back until it does.****
>
>    - File {path} from {some package} was already stripped, this will
>    prevent future debugging! Is this a consequence of using a prebuilt
>    toolchain? Are these compile options that I can change if I need to?**=
*
>    *
>
> Usually that is what causes this.  Just means that there were no symbols
> that could be split into a dbg package****
>
>    - For recipe {some recipe name}, the following files/directories were
>    installed but not shipped in any package: followed by a list of files.=
 I
>    assume this is harmless, but it adds to the build time. Is that correc=
t?
>    ****
>
> Depends if you want that file.  I means that the do_install step put
> something into the ${D} directory but that the FILES variable for the
> packages doesn=92t include it so it doesn=92t get packaged.  Shouldn=92t =
increase
> build time really, but is a hint to you in case there was a file there th=
at
> you =93need=94****
>
>    - QA Issue: No GNU_HASH in the elf binary: {some path} What does this
>    mean? Is the code compliant with the appropriate license?****
>
> I think this means that the code was build without the GNU_HASH flag.
> Maybe an inclusion of a pre-built binary.****
>
>    - QA Issue: non -staticdev package contains static .a library What
>    does this mean?****
>
> It means that there is a .a file in a =96dev package which expects .so fi=
les
> be default is my understanding.  Not the end of the world.****
>
>    - QA Issue: {some package: some path} links to something under
>    exec_prefix followed by QA Issue: ldd reports: followed by a number of
>    symbolic links. What does this mean?****
>
> Note sure without the message.****
>
>    - TI installer requires 32bit glibc libraries for proper operation.
>    What does this mean? Is my build machine Linux environment not set up
>    properly? ****
>
> Where did this come from?  If you are running on a 64bit system you
> usually need ia32-libs package installed for 32bit compatibility.****
>
>    - {package name} No generic license file exists for: {License Name} in
>    any provider. Is this a consequence of some automatic license detectio=
n
>    software failing, or something more serious (we don't know how this co=
de is
>    licensed)?****
>
> What recipe.  You need to have the license file declared in the recipe as
> well as the checksum.  This is to ensure the proper licensing of the
> package.****
>
>    - QA Issue: {name}: Found a reference to /usr/ {some path} followed
>    by WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir sh=
ould
>    not reference anything in exec_prefix What does this mean?****
>
> Not 100% here without looking at the script.  I=92m guessing that they do=
n=92t
> want the script to use a hard coded /usr/bin, etc value but I could be
> wrong here.****
>
>    - QA Issue: package {name} contains bad RPATH {path} in file {path 2}
>    What does this mean?****
>
> Not 100% on this.  Usually means that it may be trying to look in the
> wrong place for a file.  What package throws this?****
>
> Are these all benign issues? Do any warrant me posting my cooker.log.x
> file? If so, what are the rules for doing that on this list? ****
>
> ** **
>
> Log files per error would be easiest.****
>
> ** **
>
> --Paul****
>



--=20
Paul Kovitz
Lead Embedded Software Engineer
Welch Allyn
8500 SW Creekside Place
Beaverton, OR 97008
503-530-7304 (voice)

--f46d042f930c0a47b204d30ba56c
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Chase.=A0<div><br></div><div>Took me a while to get bac=
k to this.</div><div><br></div><div>I am attaching a tarball with all the s=
eparate warning files for the other issues. I created the file manually so =
I could analyze it better. There are 46 separate log files if I ignore the =
failed to fetch warnings.=A0<br>


</div><div><div><br></div><div>do_populate_lic failed to find the CC-BY-SA =
license for 14 files in ./all-oe-linux/matrix-gui-* and for ./all-oe-linux-=
gnueabi/matrix-gui-generic-pm-2.0-r10.0 and for ./armv7a-vfp-neon-oe-linux-=
gnueabi/matrix-gui-3d-demos-2.0-r10.1<div>


<br></div><div>do_populate_lic failed to find the TI-TSPA=A0license =A0./al=
l-oe-linux-gnueabi/wl12xx-firmware-git-r1-gitrol_R5.SP3.05 ./am335x_evm-oe-=
linux-gnueabi/bt-firmware-git-r0+gitrdb43d1f05efda9777d7ac1ac366637e29e21f7=
7f</div>


</div><div><br></div><div>do_populate_lic failed to=A0find the TI-BSP licen=
se=A0armv7a-vfp-neon-oe-linux-gnueabi/am33x-cm3-05.06.00.00-r0-arago0=A0</d=
iv><div><div>do_populate_lic failed to=A0find the TSPA license=A0armv7a-vfp=
-neon-oe-linux-gnueabi/libgles-omap3-4.08.00.01-r35</div>

</div><div><br></div><div style>The other packages with license issues are =
debianutiils, iozone3, iperf, libc-client, nbench, orc and php.</div>
<div><br></div><div>Th ia32-libs warning appears twice for me, but it is no=
t clear to me what package caused the warnings because I running 8 threads =
on 8 cores. Is is do_configure? Here are small snips from the cooker log</d=
iv>

<div><br></div><div><div><font face=3D"courier new, monospace">NOTE: packag=
e libpcre-8.21-r1: task do_configure: Started</font></div>
<div><font face=3D"courier new, monospace">WARNING: TI installer requires 3=
2bit glibc libraries for proper operation</font></div><div><font face=3D"co=
urier new, monospace">run &#39;yum install glibc.i686&#39; on Fedora or &#3=
9;apt-get install ia32-libs&#39; on Ubuntu/Debian</font></div>

</div><div><font face=3D"courier new, monospace"><br></font></div><div>
<div><font face=3D"courier new, monospace">NOTE: Running task 975 of 3742 (=
ID: 2421, /home/bone/oe/oe-layersetup/sources/oe-core/meta/recipes-support/=
lzo/<a href=3D"http://lzo_2.06.bb" target=3D"_blank">lzo_2.06.bb</a>, do_co=
nfigure)</font></div>

<div><font face=3D"courier new, monospace">WARNING: TI installer requires 3=
2bit glibc libraries for proper operation</font></div>
<div><font face=3D"courier new, monospace">run &#39;yum install glibc.i686&=
#39; on Fedora or &#39;apt-get install ia32-libs&#39; on Ubuntu/Debian</fon=
t></div><div><font face=3D"courier new, monospace">NOTE: package lzo-2.06-r=
1: task do_configure: Started</font></div>

</div><div><br></div><div>It appears that far as ubunutu is concerned, ia32=
-libs package is not available</div>
<div><br></div><div><div><font face=3D"courier new, monospace">$ sudo apt-g=
et install ia32-libs</font></div><div><font face=3D"courier new, monospace"=
>Reading package lists... Done</font></div><div><font face=3D"courier new, =
monospace">Building dependency tree =A0 =A0 =A0=A0</font></div>


<div><font face=3D"courier new, monospace">Reading state information... Don=
e</font></div><div><font face=3D"courier new, monospace">Package ia32-libs =
is not available, but is referred to by another package.</font></div><div>

<font face=3D"courier new, monospace">This may mean that the package is mis=
sing, has been obsoleted, or</font></div>
<div><font face=3D"courier new, monospace">is only available from another s=
ource</font></div><div><font face=3D"courier new, monospace"><br></font></d=
iv><div><font face=3D"courier new, monospace">E: Package &#39;ia32-libs&#39=
; has no installation candidate</font></div>


</div><div><br></div><div>I don&#39;t have experience handling this sort of=
 issue. It looks like I can install ia32-libs-multiarch. Should that do it?=
=A0</div><div><br></div><div>I wonder about some of the other errors, espec=
ially the ones about no GNU_HASH. I sourced the toolchain=A0arago-2011.09/a=
rmv7a/evironment-setup script before I ran bitbake. Should I have just put =
the toolchain in my path? I wonder if some of the other environment variabl=
es are used differently by the bitbake recipes.</div>


<div><br></div><div style>Thanks for your help</div><div style><br></div><d=
iv style>--Paul Kovitz</div><div><br></div></div><div class=3D"gmail_extra"=
><br><br><div class=3D"gmail_quote">On Mon, Jan 7, 2013 at 9:12 AM, Maupin,=
 Chase <span dir=3D"ltr">&lt;<a href=3D"mailto:chase.maupin@ti.com" target=
=3D"_blank">chase.maupin@ti.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<div style=3D"border-style:none none none solid;border-left-color:blue;bord=
er-left-width:1.5pt;padding:0in 0in 0in 4pt">
<div>
<div style=3D"border-style:solid none none;border-top-color:rgb(181,196,223=
);border-top-width:1pt;padding:3pt 0in 0in">
<p class=3D""><b><span style=3D"font-size:10pt;font-family:Tahoma,sans-seri=
f">From:</span></b><span style=3D"font-size:10pt;font-family:Tahoma,sans-se=
rif"> <a href=3D"mailto:meta-arago-bounces@arago-project.org" target=3D"_bl=
ank">meta-arago-bounces@arago-project.org</a> [mailto:<a href=3D"mailto:met=
a-arago-bounces@arago-project.org" target=3D"_blank">meta-arago-bounces@ara=
go-project.org</a>]
<b>On Behalf Of </b>Paul Kovitz<br>
<b>Sent:</b> Friday, January 04, 2013 6:19 PM<br>
<b>To:</b> <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank=
">meta-arago@arago-project.org</a><br>
<b>Subject:</b> [meta-arago] 805 warning messages when I build 05.06.00.00?=
<u></u><u></u></span></p>
</div>
</div><div>
<p class=3D""><u></u>=A0<u></u></p>
<p class=3D"">Greetings. I am new to this list and relatively new to oe, so=
 if this kind of post does not belong here, please tell me.<u></u><u></u></=
p>
<div>
<p class=3D""><u></u>=A0<u></u></p>
</div>
</div><div><div>
<p class=3D"">I did a build today of the 05.06.00.00 release using this too=
lchain:<u></u><u></u></p>
</div><div><div>
<p class=3D""><a href=3D"http://software-dl.ti.com/sdoemb/sdoemb_public_sw/=
arago_toolchain/2011_09/exports/arago-2011.09-armv7a-linux-gnueabi-sdk.tar.=
bz2" target=3D"_blank">http://software-dl.ti.com/sdoemb/sdoemb_public_sw/ar=
ago_toolchain/2011_09/exports/arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz=
2</a><u></u><u></u></p>



<div>
<p class=3D""><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"">There seem to be several classes of warnings. I have question=
s about all of them. Sorry if these were covered under a previous thread. I=
 only went back in the archives a few months and didn&#39;t see it.=A0<u></=
u><u></u></p>



</div>
</div><div><div>
<ul type=3D"disc">
<li class=3D"">
Failed to fetch from some URL. I assume source was successfully gotten from=
 a mirror, so I can ignore this. True?<u></u><u></u></li></ul>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">Yes.=A0 Usually this means it didn=92t find the=
 file in one of the mirrors and will keep falling back
 until it does.<u></u><u></u></span></p><div>
<ul type=3D"disc">
<li class=3D"">
File {path}=A0from {some package} was already stripped, this will prevent f=
uture debugging! Is this a consequence of using a prebuilt toolchain? Are t=
hese compile options that I can change if I need to?<u></u><u></u></li></ul=
>



</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">Usually that is what causes this.=A0 Just means=
 that there were no symbols that could be split into
 a dbg package<u></u><u></u></span></p><div>
<ul type=3D"disc">
<li class=3D"">
For recipe {some recipe name}, the following files/directories were install=
ed but not shipped in any package: followed by a list of files. I assume th=
is is harmless, but it adds to the build time. Is that correct?<u></u><u></=
u></li>


</ul>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">Depends if you want that file.=A0 I means that =
the do_install step put something into the ${D} directory
 but that the FILES variable for the packages doesn=92t include it so it do=
esn=92t get packaged.=A0 Shouldn=92t increase build time really, but is a h=
int to you in case there was a file there that you =93need=94<u></u><u></u>=
</span></p>


<div>
<ul type=3D"disc">
<li class=3D"">
QA Issue: No GNU_HASH in the elf binary: {some path} What does this mean? I=
s the code compliant with the appropriate license?<u></u><u></u></li></ul>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">I think this means that the code was build with=
out the GNU_HASH flag.=A0 Maybe an inclusion of a pre-built
 binary.<u></u><u></u></span></p><div>
<ul type=3D"disc">
<li class=3D"">
QA Issue: non -staticdev package contains static .a library What does this =
mean?<u></u><u></u></li></ul>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">It means that there is a .a file in a =96dev pa=
ckage which expects .so files be default is my understanding.=A0
 Not the end of the world.<u></u><u></u></span></p><div>
<ul type=3D"disc">
<li class=3D"">
QA Issue: {some package: some path} links to something under exec_prefix fo=
llowed by=A0QA Issue: ldd reports: followed by a number of symbolic links. =
What does this mean?<u></u><u></u></li></ul>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">Note sure without the message.<u></u><u></u></s=
pan></p><div>
<ul type=3D"disc">
<li class=3D"">
TI installer requires 32bit glibc libraries for proper operation. What does=
 this mean? Is my build machine Linux environment not set up properly?=A0<u=
></u><u></u></li></ul>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">Where did this come from?=A0 If you are running=
 on a 64bit system you usually need ia32-libs package
 installed for 32bit compatibility.<u></u><u></u></span></p><div>
<ul type=3D"disc">
<li class=3D"">
{package name} No generic license file exists for: {License Name} in any pr=
ovider. Is this a consequence of some automatic license detection software =
failing, or something more serious (we don&#39;t know how this code is lice=
nsed)?<u></u><u></u></li>


</ul>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">What recipe.=A0 You need to have the license fi=
le declared in the recipe as well as the checksum.=A0
 This is to ensure the proper licensing of the package.<u></u><u></u></span=
></p><div>
<ul type=3D"disc">
<li class=3D"">
QA Issue: {name}: Found a reference to /usr/ {some path} followed by=A0WARN=
ING: QA Issue: Shell scripts in base_bindir and base_sbindir should not ref=
erence anything in exec_prefix What does this mean?<u></u><u></u></li></ul>



</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">Not 100% here without looking at the script.=A0=
 I=92m guessing that they don=92t want the script to use
 a hard coded /usr/bin, etc value but I could be wrong here.<u></u><u></u><=
/span></p><div>
<ul type=3D"disc">
<li class=3D"">
QA Issue: package {name} contains bad RPATH {path} in file {path 2} What do=
es this mean?<u></u><u></u></li></ul>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">Not 100% on this.=A0 Usually means that it may =
be trying to look in the wrong place for a file.=A0 What
 package throws this?<u></u><u></u></span></p>
<div>
<div><div>
<p class=3D"">Are these all benign issues? Do any warrant me posting my coo=
ker.log.x file? If so, what are the rules for doing that on this list?=A0<u=
></u><u></u></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-=
serif;color:rgb(31,73,125)">Log files per error would be easiest.<u></u><u>=
</u></span></p>
</div>
<div>
<p class=3D""><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"">--Paul<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>Paul Kovitz<=
div>Lead Embedded Software Engineer<br><div>Welch Allyn</div><div>8500 SW C=
reekside Place</div><div>Beaverton, OR 97008</div><div><a href=3D"tel:503-5=
30-7304" value=3D"+15035307304" target=3D"_blank">503-530-7304</a> (voice)<=
/div>


</div>
</div></div>

--f46d042f930c0a47b204d30ba56c--

--f46d042f930c0a47b604d30ba56e
Content-Type: application/x-gzip; name="warnings.tar.gz"
Content-Disposition: attachment; filename="warnings.tar.gz"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hbtxuvev0

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
/PGHstJbNZzzBUGm2TSgec5z/fnJzhZptddqVBfLZSKZ/uRsJwtV91WN4nIxCiKlGeDj8m41jGVn
1TiuzDiekwSpTvYXKzzSOJjSNH58zmyMaKXPVWFiPt3xYFbGcd6kTDrZNV3qHjekh/os54Wkux5Q
o9MNWbKvg+fqaR0810/y4Hn9JA6e7xejSHbGLMkKs5AncvSNy6OvW0PvSLFZWAudDZ5Jas3a4XvQ
aSSeFm20OKB0mu1MsM8skLWleNJpNFvZ5okTryN95omnrVhM7lmmrFjMy6erPBJhd52qAlnrQ0lT
sY//RnTMyKIOwPmJfRYI4P7v1dXVtY7/X5/5+987+XJbf7ssEMj6X5/p/J/zq6tzv/67+Bpg/ess
EJ7pQBa9iVl4dHb2/cl53UfP+l+cXF2urv/5ydnplc//2MVXpcb/nY70O7fa7CoEHZHR508//ePD
+x/fffz87te3n4xe/cunD7dnS493gx9M/siUpjRnOmQf0lSUiSQjes9EGcZUVuavb99/uFFYFu8e
lsHh/GmYodv4u5pLEFEhI5YfD2aWRkqH4w81fnHsSXC8f4vSavr7tDC3DXBVja1ksIILj/0tjV1R
+llavrApeiP48Wm8a3sYyQGHYhofxJe9/t/GbPriT5Cfd5iB9vbf5cX15bnO/z479fn/O/kabv3b
fQGA9b88udD2/9Xppa//tpOvgdd//UbI+fn1Zff6X16fnSpjf2X9z08vzr39v5Ovyh6oFswkHytL
h5YVS0xenElNLlMMGqV0ftbW/avFc4nK+A+JfFVq722cMrojYkRi/Qzpw8jcmcho9Jfyoskdi+NR
ltNbfV1iUsgip9rDUEy1mfV/bvRbJ1yksdJcTs+OzvQjw7vufVpE9Fazv8nBOVK/7G4INeHLhdn5
1HOqlO7bfdB+yXFSW1E7n7lWl/fIcyGL0n2SPc9Ctdd3Pu1UCGU0J8r82CPt87103kj6y+RMYwyE
LMaiFDonuxQ6NQ/ucQ2EjMI//9kk+2mRe7H7/a9kfiXv90F7vRFSpg7mQuxTCuns8n1tBlHJIZZO
9iAAmTp1bndO8GSPi52KfR54P+R8TtMP5atS+ySC2Xd7HMFnOv2ZFLHc1+GzP8m72PRm75W+8z30
/o2FO1/08sC/icaVmbF7eZeF+sV79TdzKX5n3RuK16/T75zstaK1T/smGgua39J855OP9inutZyN
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
9d3nP97+orS/n97//tffPv/xZvrqleKmLCah2RVjwePC8I7mJpaOlmPVnKd4aWWo//upk/qNmuDz
4YdXf/rOfz2zrzuSp2rriH7emEbjRPHB66PzIL84hvRxor6ur6/NT/W1/tP8fnp2cn1xcnl1en7+
3cnZ6cXJ+Xejy8eadPOrUCydj0bfaXHT1a7v82f6hV1/SZPMlglA6399qtb/7PzyzK//Lr6c1j/m
06OI31QHwdH33599v62P7vU/PTm/Ol9b/8vLS7X/T3ZBgANf/8r8+cirUHJlcZvsECZqJby2kvJC
18FjmVKkFL9UWsIKmwTm81ejIMi1kq+r6JlCO//TFNKiqdzyScqVyhaUkEGRprqqT7TTbJRV3q4V
m2ZMLiqvY5zrmxyvWu/mJQ0vZAy7QqmBcTdYNWTEQxQYbpyIm54KrPN6c03f5cXHxQAtbvCsLE9r
dr5qZJ9xnkASyFdWHgAES96Fjp/bpqjXpIY0B2dD9tN0O4gFXbcCgofWRa4WEPCgVj372xIstyYv
Jd2ZSatk6mr2xLMCt8rhRTBFfdghk7vJx9tTtxZL2dlgbeGeathjjYIH7cb3tGijxQEFMLYzwT69
6WtL8aSDE1vZ5okTb5XzPr//41215/7jFU0jRlKFUsqY6pIbYyaDc1ONQ9szZW1L/a/yt7Lvxr9N
ELxuvfhw8Y96lEsIpc4+8WCHBUGfZWjDYl4+kPFIhN112AKy1j5IsfJl7/9j/Jtay/Pg7EpR+QQS
ALD2/56eXJ1eaP/f6fWp9//u5Au9/oAAAGj9ry+0///q6tKv/y6+3Na/DgDwTPs+6E3MwqOzy+vv
Vz33Pet/fnl6tbb+12dn197/v4uvhT+oWl7jDprSlOZMe5RDmooyJjCi90yUnqxFY62Y6KKClXcw
fxqm7hqjVpPQD7TIiOXHg1m9kVLX+EONXxz72e/XVu2b+T7N1rWxraqolfRUIOHxc8yXs57cszQk
rWfnzclHJe+ujUr4uj9H0xKg/2U0n5gXVC4fy/47uVb237W2/y6vvf6/ky/0+j+G/afX//pM23+X
Fyd+/Xfx5bb+W+2/q+vrq5U++uy/67PztfW/Pj3x9t9Ovpb2n15eO+vvI7374fNPT9T4W+XSQzP+
9jz7PRp/PTPfq/G3Ojag8efjmMMS+Xkaobaz80boo5J350YoeN2BRqi9/mfu/4cxo6kMzpRCR62t
QID+f3F6ru2/s+sLb//t5Mtx/a2sQMj6n53p+1/n1ydXfv138TXE+m+zAs9PXp+fVn30rP/FeR3/
q9f/XHOAt/928bWw/xrLa2cF/i1lt+rUY/JhwxLEI+WTAZH9nYiZ4m3JUzEg1p+VZRP8rE7vAXF+
qD54kib11o1/YIb106DB/sxru/nv08jeOsKXFWcFTvFZGrrAOXpzdwdE3rXRi+WB5xh/3fcXSP+f
KiEZ8IRk58HF0cnro5OTo5PTID+/7DYB7e2/yytdC0Bp/1cnPv63k6+B1r/TDwCw/08vTP73xaW2
//z6P/7XkOu/Vg7k7PXViVnCzvW/UI2uL+v9f315dqLtf/V/b//v4suy/sfCtP1Zm66vFtew332+
OtKGwPiXD+8+3/z46w2dxizRq69fvzm6Pnp9df36++tXpQa9wkKjOyJGJNZ1Zx9GpvZHRqO/lN3e
sThWVjC91QVDJoUscjqK6LiYasPi/+wYzeUTGc1YKTvlaMT0/ianqbLmbyYxy270Sxk7IofBL2L9
dq76IN/32rwu1ya7zT/9++9nP918eP/xb//4+Ye/f373y4e9DOkpMEo1jn2RYGXH3J7te8O8rjYM
S5nc5U559/lc9aw48ybK9cPYu94TIr+9KZI9ccD52r784cP7P/a3KRc0ef/rL4ob982Rmjh6COlk
L0yhN8K+ZNJe+988Ln7+8P7TPtnyqiko98SNegy6izMtG093fUYsl+L33z4+BRHR1G72qOLpLk73
siL7FhGKI86iPe6F/egKV0/qwFyoD0p3YXvcBYYXdrsQyyPi3d8/3+xTIJ039bi9LMRyR+6bFpeb
wnnfWtxVyZ9qeUIZ702x3q8G82SMvPP9eUWW0mp3Ov2qK2j3p9W68vbT7++fgKRUA3gqfBgqBhzH
u16W10/J73K+a7tCd7tLgbyqMu5vxXfuYnoyDtdVMbhr6j8p63U1SLFn6beHlSg9e0/E27lHbmj4
vGl+y0IqdqsHvd6170J3uy/5+yRUoFW679iLd75XB+aGFN6bMbQaatq9HnC111DTUxB8K/z4NPwE
67bSHtyaK6fjvimxZXGejq9/38R5/QRs2BVX9F7jx6/3q86u79x9uz/Pj55GCtJKbGDvyvYTWZU9
x7TXI0d79sVdHu07aqF1sZ2bIJXxu2Oba4XkewwCFCLcp9q57+yiq6eRXbQymH07gbcHCva9UpdP
aaVWBrNnk3VP6cSbe3nPfpSrXWcdrPqw9xo32qMPdQ++i3Wn7RNw4O2B8eoo3X5yzZ5AxPZyb67y
Os1vpwHSBaPtNEy6B8/063273dauQez5Nso+Eyr3YhS93ivxl8J1DymM50+G9Z9GmsAWI+1J+PGe
godm7068p8YfTyCYuOFd3NsyXT2ZiM3VE1EY95NvuXKlb485+Vf79hZc7fto2zcPxpt3sPcesNzv
BZEd53vWnppdp5jvMbt91yktps+9RVL24Iq6ekJq4RPRf55S0KCRELGXOO9qcu0utY/VU3/3junz
J2CzXe1d92p4cvZ6S3zX95te76HP833e6nsaYckNQ3jf2ezne1C5Wu3ffa/OSsb13u0QxSGfQ57R
z5W6tocA3t71gqfkxFrNm9w3r17t20Ssa5vsOBWsTqrYdTS/ugG56xjy1d7k85ayAI/KaVVlw7xI
Ddyb8n2rsiLxSmXLwHz+ahQEua7/TQNBQ8l4+j+P9NtXGvnmJymXVP3ZQAZFmlKqi4W/2m2R5CWZ
1stxVmUbW83WNmGzA6I9SRrpvfH5l38cy1whV9wT8iLXhfd/J3fHv2manb2Nsxn5IaZptAsiPSfO
siu56TmrjbPepzLnUaGLxn/6+R8HTaiOiql+0zU2naWZ42m2IqgA9Wc95Va5zQv3TuEeqRE3RPq/
E0E9C62xkN9k9npUu7PokHfatvLQh0yPLZLnI7llU6IHf/6Tp80qbX4uci9yVkXOWtFzT51t+uLW
pD5Pqg1GsskC8GTbxmHdocRDF+PtnpNPNJdFPqbR327FQZNp9ZkCv8naxPiWjCBPrFUzbX9kepJU
6RdCP8ScJ56Nul1tbfmJnmxtQbqN5LFD3oEbD594vtnmOurPAvN02yamOlISDnvXrT1uc8jE6FYC
Ps9IxO9+JVmmPva7bKt08gq4lQK+7brcIW+8bQ89eZ7ZpjY+Be/bk6QSLAfn33//PKNxfPDUWguf
nP2dqP791tviL9l61ejQ2ad9s/2odpdWmHakKj1ZKm08m+f3VosTqa14sCfYtiicF0lwkaSs/5je
f2DTmfQW3FajZI978ElSpk1NWqbgeNKskuZvguY/xiz7FJOU7iRg+3z2GOjV1EPmq/W3XA+ZFhCb
9g81EL/netKWfJjS/jqAz1Fuz8TZ1w2mJ0yWy90mKD1ZSnTL7J+5d4l4Zz8o1t9SCv+QuWibWfZ5
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
yCM6n542L0wP8+a0AbRsG42nli0X/oOuaXRP4C+jVwo+UIqa5VRsJ8FD25aL4fc+3M1DEtOq8U+/
fXw3umNyNvr09sd/ffvLOzW9P/307oe/qX3zWZKpxjNRx48YTXKejJ7MBplPIyLJSPJhhlTh6x2V
J81zJo2YabVyMMqIB5FzLsUxSc7PL+8DeptUXdS0+JTTjOSaGjKn9MnQoWaRCc8rl6keIpFPZoBC
i2QamC6D6jCsR/3EaVvx2PMibcW1gkbapa5Uo6yQ5Qb+0+9KMbjVc5iRPAp5RCPjL692domt9rsr
DWrC0uhpz3X0n/88ClKS0NE//Y+jmPzTKOCLfwchTydsuvK3m/pv//kvo0A+ZHQ0Gf230gCeEMtt
m+aE3SfURDb+e3RP8qnSwNTSBWwU0NEr8eaxBOCbn9//49d3n/94+4tSvX96//tff/v8x5vpq1eK
j7KYhGYzjAWPC8M1mo+UHr4cq+Y5xUUrQ/3fT5rOb9TsngknvPrTd/v/Ojo+Ov5fH3g6/cDS+SP1
cVJ+tf08Ob24Wvxu/n56enl19d3owyONZ+WrUGuUj0bf6Z3T1a7v82f6dUdybTgKR06XNMmOYz49
ivhNxrMiVnx/E7Pw6Oz6+7PX+56k/2r92sX66019fX3dtv/Pr09Ovzs9O7m+OLm8uji7/O7k/PTk
9Pq70ckuCHDg+3/hlVtZXuOam9KU5ixUn4Q0FdQoAyN6z7T7SOnTb0Z/fP70VusLJH0YZblSSyOa
PwOzs5pPEFEhI5YfD2aARkqn4g81fnHsabFJiydqJm7Q4ZkYjJWoVQjC4xduLzan+tKNxuZcveW4
Q2I/YfNxK08425Ag/S8jSXB6dHp0GeQXx/Z99Oh/5vdS/7s+Pzu/+O7k7FT98t3o0nFuVl8Hrv/h
19+o/FZ9gNb/Sv397Ozq+sqv/y6+HNe/NvlKBeLo/PR0y6J1rv/p2dXp2ena+l+dXF54+28XX5Va
nhepkDnL1JGtGKE6zFbWPzCfvxoFQa5VShoIGkrG0/95FPIkoanc8knKlXKw4yyOFR6tfa46N0ON
qsiZfFB/TG6UeqI6Oi6yjOYffvv7u99f/ekwKKEzVYS+plak7P6myCKlUuxi7kEJGRRpSqm2Qp4C
MTRblJ/dJEyEOlvn5Oj12dHJQXGDsgzp8QfT/tPbX4/vTTbNsRQy0ITRfHJx0ByyIjhiJqS2bUwS
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
kvL/qEe8pwCIEwA=

--f46d042f930c0a47b604d30ba56e--
