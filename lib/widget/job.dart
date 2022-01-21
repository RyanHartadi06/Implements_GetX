import 'package:flutter/material.dart';
import 'package:latihan_slicing/model/job_model.dart';

import '../theme.dart';

class Job extends StatelessWidget {
  const Job({Key? key, required this.job}) : super(key: key);

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      width: 314,
      height: 234,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: borderColor)),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: borderColor),
              //     image:
              //         DecorationImage()),

              child: Image.network(job.companyLogo),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              width: 283,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.name,
                    style: blackTextStyle.copyWith(fontSize: 18),
                  ),
                  Text(
                    job.companyName,
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Row(
                    children: [
                      Text(
                        job.location,
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        job.category,
                        style: blackTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
