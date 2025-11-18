Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ED0CEE34D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 19:17:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5099.1763493417879329090
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 11:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 111A640C7B;
	Tue, 18 Nov 2025 19:16:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AGiqsqtEevSK; Tue, 18 Nov 2025 19:16:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C1A9B40BD6;
	Tue, 18 Nov 2025 19:16:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7A5151756E9; Tue, 18 Nov 2025 14:16:53 -0500 (EST)
Date: Tue, 18 Nov 2025 14:16:53 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: s-sadik@ti.com
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Prudhvi Veeramchaneni <prudhvi@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v4] meta-arago-test: Add
 CoreMark CPU benchmark
Message-ID: <20251118191653.GE3125@denix.org>
References: <20251118143523.875103-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251118143523.875103-1-s-sadik@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Nov 2025 19:17:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16786

Can we please stop specifying the layer prefix in the subject? Sure, this=
=20
patch spans across multiple dirs, but still it's all about coremark, hence =
the=20
Subject prefix should be "coremark: add ..."

Also, what is the version of this package? Do you want to set the version i=
n=20
the filename or the PV variable in the recipe?


On Tue, Nov 18, 2025 at 08:05:23PM +0530, Sadik via lists.yoctoproject.org =
wrote:
> Add CoreMark benchmark recipe to measure CPU
> performance on TI platforms,Integrate CoreMark
> into ti-test package group alongside arm-benchmarks.
>=20
> CoreMark is an industry-standard CPU benchmark from EEMBC
> (Embedded Microprocessor Benchmark Consortium) that provides
> a standardized method to test the performance of processors.
>=20
> Signed-off-by: sadik <s-sadik@ti.com>
> ---
>=20
> Changes in v4:
> - change logs moved after the "---" line
> - change the summary of the coremark in recipe
>=20
> Link to v3:https://lists.yoctoproject.org/g/meta-arago/message/16776
>=20
> Changes in v3:
> - sent patch via UTF-8 encoding
>=20
>=20
> Changes in v2:
> - Include Coremark licese file in licenses
> - Use oe_runmake with proper compiler flags for cross-compilation
> - Removed unnecessary TARGET_CC_ARCH, COMPATIBLE_HOST, and SRC_URI checks=
um
> - Move coremark in alphabetical order in TI_TEST_TI_TOOLS
>=20
> Link to v1:https://lists.yoctoproject.org/g/meta-arago/message/16707
>=20
>  meta-arago-test/licenses/Coremark             | 91 +++++++++++++++++++
>  .../recipes-benchmark/coremark/coremark.bb    | 18 ++++
>  .../recipes-core/packagegroups/ti-test.bb     |  1 +
>  3 files changed, 110 insertions(+)
>  create mode 100644 meta-arago-test/licenses/Coremark
>  create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark.bb
>=20
> diff --git a/meta-arago-test/licenses/Coremark b/meta-arago-test/licenses=
/Coremark
> new file mode 100644
> index 00000000..c6e062f8
> --- /dev/null
> +++ b/meta-arago-test/licenses/Coremark
> @@ -0,0 +1,91 @@
> +COREMARK=C2=AE ACCEPTABLE USE AGREEMENT
> +This ACCEPTABLE USE AGREEMENT (this =E2=80=9CAgreement=E2=80=9D) is offe=
red by Embedded Microprocessor Benchmark Consortium, a California nonprofit=
 corporation (=E2=80=9CLicensor=E2=80=9D), to users of its CoreMark=C2=AE s=
oftware (=E2=80=9CLicensee=E2=80=9D) exclusively on the following terms.
> +
> +Licensor offers benchmarking software (=E2=80=9CSoftware=E2=80=9D) pursu=
ant to an open source license, but carefully controls use of its benchmarks=
 and their associated goodwill. Licensor has registered its trademark in on=
e of the benchmarks available through the Software, COREMARK, Ser. No. 85/4=
87,290; Reg. No. 4,179,307 (the =E2=80=9CTrademark=E2=80=9D), and promotes =
the use of a standard metric as a benchmark for assessing the performance o=
f embedded systems. Solely on the terms described herein, Licensee may use =
and display the Trademark in connection with the generation of data regardi=
ng measurement and analysis of computer and embedded system benchmarking vi=
a the Software (the =E2=80=9CLicensed Use=E2=80=9D).
> +
> +Article 1 =E2=80=93 License Grant.
> +1.1. License. Subject to the terms and conditions of this Agreement, Lic=
ensor hereby grants to Licensee, and Licensee hereby accepts from Licensor,=
 a personal, non-exclusive, royalty-free, revocable right and license to us=
e and display the Trademark during the term of this Agreement (the =E2=80=
=9CTerm=E2=80=9D), solely and exclusively in connection with the Licensed U=
se. During the Term, Licensee (i) shall not modify or otherwise create deri=
vative works of the Trademark, and (ii) may use the Trademark only to the e=
xtent permitted under this License. Neither Licensee nor any affiliate or a=
gent thereof shall otherwise use the Trademark without the prior express wr=
itten consent of Licensor, which may be withheld in its sole and absolute d=
iscretion. All rights not expressly granted to Licensee hereunder shall rem=
ain the exclusive property of Licensor.
> +
> +1.2. Modifications to the Software. Licensee shall not use the Trademark=
 in connection with any use of a modified, derivative, or otherwise altered=
 copy of the Software.
> +
> +1.3. Licensor=E2=80=99s Use. Nothing in this Agreement shall preclude Li=
censor or any of its successors or assigns from using or permitting other e=
ntities to use the Trademark, whether or not such entity directly or indire=
ctly competes or conflicts with Licensee=E2=80=99s Licensed Use in any mann=
er.
> +
> +1.4. Term and Termination. This Agreement is perpetual unless terminated=
 by either of the parties. Licensee may terminate this Agreement for conven=
ience, without cause or liability, for any reason or for no reason whatsoev=
er, upon ten (10) business days written notice. Licensor may terminate this=
 Agreement effective immediately upon notice of breach. Upon termination, L=
icensee shall immediately remove all implementations of the Trademark from =
the Licensed Use, and delete all digitals files and records of all material=
s related to the Trademark.
> +
> +Article 2 =E2=80=93 Ownership.
> +2.1. Ownership. Licensee acknowledges and agrees that Licensor is the ow=
ner of all right, title, and interest in and to the Trademark, and all such=
 right, title, and interest shall remain with Licensor. Licensee shall not =
contest, dispute, challenge, oppose, or seek to cancel Licensor=E2=80=99s r=
ight, title, and interest in and to the Trademark. Licensee shall not prose=
cute any application for registration of the Trademark. Licensee shall disp=
lay appropriate notices regarding ownership of the Trademark in connection =
with the Licensed Use.
> +
> +2.2. Goodwill. Licensee acknowledges that Licensee shall not acquire any=
 right, title, or interest in the Trademark by virtue of this Agreement oth=
er than the license granted hereunder, and disclaims any such right, title,=
 interest, or ownership. All goodwill and reputation generated by Licensee=
=E2=80=99s use of the Trademark shall inure to the exclusive benefit of Lic=
ensor. Licensee shall not by any act or omission use the Trademark in any m=
anner that disparages or reflects adversely on Licensor or its Licensed Use=
 or reputation. Licensee shall not take any action that would interfere wit=
h or prejudice Licensor=E2=80=99s ownership or registration of the Trademar=
k, the validity of the Trademark or the validity of the license granted by =
this Agreement. If Licensor determines and notifies Licensee that any act t=
aken in connection with the Licensed Use (i) is inaccurate, unlawful or off=
ensive to good taste; (ii) fails to provide for proper trademark notices, o=
r (iii) otherwise violates Licensee=E2=80=99s obligations under this=20
> Agreement, the license granted under this Agreement shall terminate.
> +
> +Article 3 =E2=80=93 Indemnification.
> +3.1. Indemnification Generally. Licensee agrees to indemnify, defend, an=
d hold harmless (collectively =E2=80=9Cindemnify=E2=80=9D or =E2=80=9Cindem=
nification=E2=80=9D) Licensor, including Licensor=E2=80=99s members, manage=
rs, officers, and employees (collectively =E2=80=9CRelated Persons=E2=80=9D=
), from and against, and pay or reimburse Licensor and such Related Persons=
 for, any and all third-party actions, claims, demands, proceedings, invest=
igations, inquiries (collectively, =E2=80=9CClaims=E2=80=9D), and any and a=
ll liabilities, obligations, fines, deficiencies, costs, expenses, royaltie=
s, losses, and damages (including reasonable outside counsel fees and expen=
ses) associated with such Claims, to the extent that such Claim arises out =
of (i) Licensee=E2=80=99s material breach of this Agreement, or (ii) any al=
legation(s) that Licensee=E2=80=99s actions infringe or violate any third-p=
arty intellectual property right, including without limitation, any U.S. co=
pyright, patent, or trademark, or are otherwise found to be tortious or cri=
minal (whether or not such indemnified pe
> rson is a named party in a legal proceeding).
> +
> +3.2. Notice and Defense of Claims. Licensor shall promptly notify Licens=
ee of any Claim for which indemnification is sought, following actual knowl=
edge of such Claim, provided however that the failure to give such notice s=
hall not relieve Licensee of its obligations hereunder except to the extent=
 that Licensee is materially prejudiced by such failure. In the event that =
any third-party Claim is brought, Licensee shall have the right and option =
to undertake and control the defense of such action with counsel of its cho=
ice, provided however that (i) Licensor at its own expense may participate =
and appear on an equal footing with Licensee in the defense of any such Cla=
im, (ii) Licensor may undertake and control such defense in the event of th=
e material failure of Licensee to undertake and control the same; and (iii)=
 the defense of any Claim relating to the intellectual property rights of L=
icensor or its licensors and any related counterclaims shall be solely cont=
rolled by Licensor with counsel of its choice. Lic
> ensee shall not consent to judgment or concede or settle or compromise an=
y Claim without the prior written approval of Licensor (whose approval shal=
l not be unreasonably withheld), unless such concession or settlement or co=
mpromise includes a full and unconditional release of Licensor and any appl=
icable Related Persons from all liabilities in respect of such Claim.
> +
> +Article 4 =E2=80=93 Miscellaneous.
> +4.1. Relationship of the Parties. This Agreement does not create a partn=
ership, franchise, joint venture, agency, fiduciary, or employment relation=
ship between the parties.
> +
> +4.2. No Third-Party Beneficiaries. Except for the rights of Related Pers=
ons under Article 3 (Indemnification), there are no third-party beneficiari=
es to this Agreement.
> +
> +4.3. Assignment. Licensee=E2=80=99s rights hereunder are non-assignable,=
 and may not be sublicensed.
> +
> +4.4. Equitable Relief. Licensee acknowledges that the remedies available=
 at law for any breach of this Agreement will, by their nature, be inadequa=
te. Accordingly, Licensor may obtain injunctive relief or other equitable r=
elief to restrain a breach or threatened breach of this Agreement or to spe=
cifically enforce this Agreement, without proving that any monetary damages=
 have been sustained, and without the requirement of posting of a bond prio=
r to obtaining such equitable relief.
> +
> +4.5. Governing Law. This Agreement will be interpreted, construed, and e=
nforced in all respects in accordance with the laws of the State of Califor=
nia, without reference to its conflict of law principles.
> +
> +4.6. Attorneys=E2=80=99 Fees. If any legal action, arbitration or other =
proceeding is brought for the enforcement of this Agreement, or because of =
an alleged dispute, breach, default, or misrepresentation in connection wit=
h any of the provisions of this Agreement, the successful or prevailing par=
ty shall be entitled to recover its reasonable attorneys=E2=80=99 fees and =
other reasonable costs incurred in that action or proceeding, in addition t=
o any other relief to which it may be entitled.
> +
> +4.7. Amendment; Waiver. This Agreement may not be amended, nor may any r=
ights under it be waived, except in writing by Licensor.
> +
> +4.8. Severability. If any provision of this Agreement is held by a court=
 of competent jurisdiction to be contrary to law, the provision shall be mo=
dified by the court and interpreted so as best to accomplish the objectives=
 of the original provision to the fullest extent permitted by law, and the =
remaining provisions of this Agreement shall remain in effect.
> +
> +4.9. Entire Agreement. This Agreement constitutes the entire agreement b=
etween the parties and supersedes all prior and contemporaneous agreements,=
 proposals or representations, written or oral, concerning its subject matt=
er.
> +
> +Apache License
> +Version 2.0, January 2004
> +
> +http://www.apache.org/licenses/
> +
> +TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
> +Definitions.
> +"License" shall mean the terms and conditions for use, reproduction, and=
 distribution as defined by Sections 1 through 9 of this document.
> +
> +"Licensor" shall mean the copyright owner or entity authorized by the co=
pyright owner that is granting the License.
> +
> +"Legal Entity" shall mean the union of the acting entity and all other e=
ntities that control, are controlled by, or are under common control with t=
hat entity. For the purposes of this definition, "control" means (i) the po=
wer, direct or indirect, to cause the direction or management of such entit=
y, whether by contract or otherwise, or (ii) ownership of fifty percent (50=
%) or more of the outstanding shares, or (iii) beneficial ownership of such=
 entity.
> +
> +"You" (or "Your") shall mean an individual or Legal Entity exercising pe=
rmissions granted by this License.
> +
> +"Source" form shall mean the preferred form for making modifications, in=
cluding but not limited to software source code, documentation source, and =
configuration files.
> +
> +"Object" form shall mean any form resulting from mechanical transformati=
on or translation of a Source form, including but not limited to compiled o=
bject code, generated documentation, and conversions to other media types.
> +
> +"Work" shall mean the work of authorship, whether in Source or Object fo=
rm, made available under the License, as indicated by a copyright notice th=
at is included in or attached to the work (an example is provided in the Ap=
pendix below).
> +
> +"Derivative Works" shall mean any work, whether in Source or Object form=
, that is based on (or derived from) the Work and for which the editorial r=
evisions, annotations, elaborations, or other modifications represent, as a=
 whole, an original work of authorship. For the purposes of this License, D=
erivative Works shall not include works that remain separable from, or mere=
ly link (or bind by name) to the interfaces of, the Work and Derivative Wor=
ks thereof.
> +
> +"Contribution" shall mean any work of authorship, including the original=
 version of the Work and any modifications or additions to that Work or Der=
ivative Works thereof, that is intentionally submitted to Licensor for incl=
usion in the Work by the copyright owner or by an individual or Legal Entit=
y authorized to submit on behalf of the copyright owner. For the purposes o=
f this definition, "submitted" means any form of electronic, verbal, or wri=
tten communication sent to the Licensor or its representatives, including b=
ut not limited to communication on electronic mailing lists, source code co=
ntrol systems, and issue tracking systems that are managed by, or on behalf=
 of, the Licensor for the purpose of discussing and improving the Work, but=
 excluding communication that is conspicuously marked or otherwise designat=
ed in writing by the copyright owner as "Not a Contribution."
> +
> +"Contributor" shall mean Licensor and any individual or Legal Entity on =
behalf of whom a Contribution has been received by Licensor and subsequentl=
y incorporated within the Work.
> +
> +Grant of Copyright License. Subject to the terms and conditions of this =
License, each Contributor hereby grants to You a perpetual, worldwide, non-=
exclusive, no-charge, royalty-free, irrevocable copyright license to reprod=
uce, prepare Derivative Works of, publicly display, publicly perform, subli=
cense, and distribute the Work and such Derivative Works in Source or Objec=
t form.
> +
> +Grant of Patent License. Subject to the terms and conditions of this Lic=
ense, each Contributor hereby grants to You a perpetual, worldwide, non-exc=
lusive, no-charge, royalty-free, irrevocable (except as stated in this sect=
ion) patent license to make, have made, use, offer to sell, sell, import, a=
nd otherwise transfer the Work, where such license applies only to those pa=
tent claims licensable by such Contributor that are necessarily infringed b=
y their Contribution(s) alone or by combination of their Contribution(s) wi=
th the Work to which such Contribution(s) was submitted. If You institute p=
atent litigation against any entity (including a cross-claim or counterclai=
m in a lawsuit) alleging that the Work or a Contribution incorporated withi=
n the Work constitutes direct or contributory patent infringement, then any=
 patent licenses granted to You under this License for that Work shall term=
inate as of the date such litigation is filed.
> +
> +Redistribution. You may reproduce and distribute copies of the Work or D=
erivative Works thereof in any medium, with or without modifications, and i=
n Source or Object form, provided that You meet the following conditions:
> +
> +You must give any other recipients of the Work or Derivative Works a cop=
y of this License; and You must cause any modified files to carry prominent=
 notices stating that You changed the files; and You must retain, in the So=
urce form of any Derivative Works that You distribute, all copyright, paten=
t, trademark, and attribution notices from the Source form of the Work, exc=
luding those notices that do not pertain to any part of the Derivative Work=
s; and If the Work includes a "NOTICE" text file as part of its distributio=
n, then any Derivative Works that You distribute must include a readable co=
py of the attribution notices contained within such NOTICE file, excluding =
those notices that do not pertain to any part of the Derivative Works, in a=
t least one of the following places: within a NOTICE text file distributed =
as part of the Derivative Works; within the Source form or documentation, i=
f provided along with the Derivative Works; or, within a display generated =
by the Derivative Works, if and wherever such thir
> d-party notices normally appear. The contents of the NOTICE file are for =
informational purposes only and do not modify the License. You may add Your=
 own attribution notices within Derivative Works that You distribute, along=
side or as an addendum to the NOTICE text from the Work, provided that such=
 additional attribution notices cannot be construed as modifying the Licens=
e.
> +
> +You may add Your own copyright statement to Your modifications and may p=
rovide additional or different license terms and conditions for use, reprod=
uction, or distribution of Your modifications, or for any such Derivative W=
orks as a whole, provided Your use, reproduction, and distribution of the W=
ork otherwise complies with the conditions stated in this License.
> +
> +Submission of Contributions. Unless You explicitly state otherwise, any =
Contribution intentionally submitted for inclusion in the Work by You to th=
e Licensor shall be under the terms and conditions of this License, without=
 any additional terms or conditions. Notwithstanding the above, nothing her=
ein shall supersede or modify the terms of any separate license agreement y=
ou may have executed with Licensor regarding such Contributions.
> +
> +Trademarks. This License does not grant permission to use the trade name=
s, trademarks, service marks, or product names of the Licensor, except as r=
equired for reasonable and customary use in describing the origin of the Wo=
rk and reproducing the content of the NOTICE file.
> +
> +Disclaimer of Warranty. Unless required by applicable law or agreed to i=
n writing, Licensor provides the Work (and each Contributor provides its Co=
ntributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY K=
IND, either express or implied, including, without limitation, any warranti=
es or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FO=
R A PARTICULAR PURPOSE. You are solely responsible for determining the appr=
opriateness of using or redistributing the Work and assume any risks associ=
ated with Your exercise of permissions under this License.
> +
> +Limitation of Liability. In no event and under no legal theory, whether =
in tort (including negligence), contract, or otherwise, unless required by =
applicable law (such as deliberate and grossly negligent acts) or agreed to=
 in writing, shall any Contributor be liable to You for damages, including =
any direct, indirect, special, incidental, or consequential damages of any =
character arising as a result of this License or out of the use or inabilit=
y to use the Work (including but not limited to damages for loss of goodwil=
l, work stoppage, computer failure or malfunction, or any and all other com=
mercial damages or losses), even if such Contributor has been advised of th=
e possibility of such damages.
> +
> +Accepting Warranty or Additional Liability. While redistributing the Wor=
k or Derivative Works thereof, You may choose to offer, and charge a fee fo=
r, acceptance of support, warranty, indemnity, or other liability obligatio=
ns and/or rights consistent with this License. However, in accepting such o=
bligations, You may act only on Your own behalf and on Your sole responsibi=
lity, not on behalf of any other Contributor, and only if You agree to inde=
mnify, defend, and hold each Contributor harmless for any liability incurre=
d by, or claims asserted against, such Contributor by reason of your accept=
ing any such warranty or additional liability.
> +
> +END OF TERMS AND CONDITIONS
> diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark.bb b/met=
a-arago-test/recipes-benchmark/coremark/coremark.bb
> new file mode 100644
> index 00000000..e7c76dbe
> --- /dev/null
> +++ b/meta-arago-test/recipes-benchmark/coremark/coremark.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "An industry-standard benchmark that measures the performanc=
e of CPUs and embedded MCUs."
> +
> +LICENSE =3D "Coremark"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D0a18b17ae63deaa8a595035f66=
8aebe1"
> +
> +SRC_URI =3D "git://github.com/eembc/coremark.git;branch=3Dmain;protocol=
=3Dhttps"
> +SRCREV =3D "d5fad6bd094899101a4e5fd53af7298160ced6ab"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile() {
> +    oe_runmake PORT_DIR=3Dlinux CC=3D"${CC}" XCFLAGS=3D"${CFLAGS}" LFLAG=
S_END=3D"${LDFLAGS}" compile
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/coremark.exe ${D}${bindir}/coremark
> +}
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta=
-arago-test/recipes-core/packagegroups/ti-test.bb
> index c1166bc2..e05add8b 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -89,6 +89,7 @@ TI_TEST_BASE:append:armv7ve =3D " \
>  TI_TEST_TI_TOOLS =3D " \
>      arm-benchmarks \
>      arm-ddr-bandwidth \
> +    coremark \
>      cpuloadgen \
>      input-utils \
>      ltp-ddt \
> --=20
> 2.34.1

